// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/formfield.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/auth.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formKey = GlobalKey<FormState>();
  bool isChecked = false;

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
            physics: const BouncingScrollPhysics(),
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
                            'Sign-Up',
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
                        width: 140,
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
                      height: height * 0.25,
                      child: Image.asset('assets/re.png')),
                  const SizedBox(
                    height: defaultPading / 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text1(text: 'Enter Your  Name'),
                      const SizedBox(
                        height: 7,
                      ),
                      DefaultFormField(
                          onSave: (value) {
                            controller.name = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the name';
                            }
                          },
                          type: TextInputType.name,
                          icon: Icons.person),
                      const SizedBox(
                        height: defaultPading,
                      ),
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
                        onSave: (value) {
                          controller.password = value;
                        },
                      ),
                      const SizedBox(
                        height: defaultPading,
                      ),
                      Text1(text: 'Please Enter You level Academy'),
                      const SizedBox(
                        height: 7,
                      ),
                      DropdownButtonFormField<String>(
                        hint: const Text(
                          'First level',
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        value: controller.selectedItem,
                        items: controller.items
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )))
                            .toList(),
                        onChanged: (item) {
                          controller.ChangeSelected(item!);
                        },
                      ),
                      const SizedBox(
                        height: defaultPading / 2,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: primaryColor,
                              value: isChecked,
                              onChanged: (newValue) {
                                setState(() {
                                  isChecked = newValue!;
                                });
                              }),
                          Text1(
                            text: 'I Agree to the terms and  policy',
                          ),
                        ],
                      ),
                      DefaultButton(
                        text: 'Sign-Up',
                        onPressed: () {
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate()) {
                            controller.CreateAccountWithEmailAndPassword();
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text1(text: 'Already have an account'),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text1(
                          text: 'Sign-In',
                          color: primaryColor,
                        ),
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
/*

*/