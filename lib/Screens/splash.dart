import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/bottom_screens/home_layout.dart';
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
      Get.offAll(() => const HomeLayOut());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: TweenAnimationBuilder(
                  curve: Curves.bounceOut,
                  tween: Tween<double>(
                    begin: 60,
                    end: size.width * 0.60,
                  ),
                  duration: const Duration(seconds: 2),
                  builder: (
                    BuildContext context,
                    dynamic value,
                    child,
                  ) {
                    return Container(
                        width: value,
                        height: value,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset('assets/s.jpeg'));
                  })),
        ],
      ),
    );
  }
}
/*

*/