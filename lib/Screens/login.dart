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
  // var email = TextEditingController();
  // var password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) => Padding(
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
                        },
                        type: TextInputType.visiblePassword,
                        icon: Icons.lock,
                        isPassword: controller.isPassword,
                        suffix: controller.suffix,
                        suffixPress: () {
                          controller.changeSuffix();
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
                            controller.SignInWithEmailAndPassword();
                          }
                        },
                      ),
                    ],
                  ),
                  /*
                 
                  */
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
                                      builder: (context) => const SignUp()));
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
