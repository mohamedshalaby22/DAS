// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/on_borading_screen.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/components/text2.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:get/get.dart';

class FourthScreen extends StatelessWidget {
  FourthScreen({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/p1.png'),
              ),
            ),
            const SizedBox(
              height: defaultPading,
            ),
            Text2(text: 'Mohamed Shalaby'),
            const SizedBox(
              height: defaultPading * 3,
            ),
            DefaultPersonal(
              title: 'Faculty :',
              text: 'Copmuter Information',
            ),
            DefaultPersonal(
              title: 'Student id :',
              text: '0411281456',
            ),
            DefaultPersonal(
              title: 'Valid until :',
              text: '30/6/2022',
            ),
            DefaultPersonal(
              title: 'Team :',
              text: '4',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPading),
              child: Divider(
                color: Color(0xffe0e0e0),
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: defaultPading * 3, horizontal: defaultPading),
              child: DefaultButton(
                  text: 'LOG OUT',
                  onPressed: () {
                    _auth.signOut();
                    Get.offAll(const HomePage());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultPersonal extends StatelessWidget {
  DefaultPersonal({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);
  String text;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: defaultPading, left: defaultPading, right: defaultPading),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text1(
            text: title,
            color: Colors.black,
            size: 20,
          ),
          Text1(
            text: text,
            color: primaryColor,
            size: 17,
          ),
        ],
      ),
    );
  }
}
