import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/login.dart';
import 'package:flutter_application_3/bottom_screens/home_layout.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
     Get.offAll(const HomeLayOut());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: width * 0.60,
                height: height * 0.45,
                child: Image.asset('assets/sp.png')),
          ),
          const SizedBox(
            height: defaultPading ,
          ),
          CircularProgressIndicator(
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
