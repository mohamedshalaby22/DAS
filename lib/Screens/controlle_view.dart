import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/on_borading_screen.dart';
import 'package:flutter_application_3/Screens/splash.dart';
import 'package:flutter_application_3/controller/auth.dart';
import 'package:get/get.dart';

class ControllerView extends GetWidget<AuthController> {
  const ControllerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null)
          ? const SplashScreen()
          : const HomePage();
    });
  }
}
