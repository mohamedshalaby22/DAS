// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/sign_up.dart';

import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/formfield.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/auth.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  var isLoading = false;
  var formKey = GlobalKey<FormState>();
  AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sign-In',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.fact_check_rounded,
                            color: primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 130,
                        height: 1.5,
                        color: aprimary,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: defaultPading / 2,
                  ),
                  SizedBox(
                      width: width,
                      height: height * 0.30,
                      child: Image.asset('assets/log.png')),
                  const SizedBox(
                    height: defaultPading / 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text1(text: 'Enter Your Email'),
                      const SizedBox(
                        height: 7,
                      ),
                      DefaultFormField(
                          onSave: (value) {
                            controller.email = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the email';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                          icon: Icons.email),
                      const SizedBox(
                        height: defaultPading,
                      ),
                      Text1(text: 'Enter Your Password'),
                      const SizedBox(
                        height: 7,
                      ),
                      DefaultFormField(
                        onSave: (value) {
                          controller.password = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the password';
                          }
                          return null;
                        },
                        type: TextInputType.visiblePassword,
                        icon: Icons.lock,
                        isPassword: controller.isPassword.value,
                        suffix: controller.isPassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        suffixPress: () {
                          controller.isPassword.value =
                              !controller.isPassword.value;
                        },
                      ),
                      const SizedBox(
                        height: defaultPading,
                      ),
                      DefaultButton(
                        text: 'Sign-In',
                        onPressed: () {
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate()) {
                            controller.isLoading.value
                                ? null
                                : controller.loadCircleProgress();
                            controller.SignInWithEmailAndPassword();
                          }
                        },
                      ),
                      const SizedBox(
                        height: defaultPading,
                      ),
                      Align(
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : null),
                    ],
                  ),
                  const SizedBox(
                    height: defaultPading * 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text1(
                        text: 'Forget Password?',
                        color: primaryColor,
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text1(text: 'Don\'t have an account'),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text1(
                              text: 'Sign-Up',
                              color: primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
