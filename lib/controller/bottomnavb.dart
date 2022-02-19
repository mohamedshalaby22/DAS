import 'package:flutter/material.dart';
import 'package:flutter_application_3/bottom_screens/first_screen.dart';
import 'package:flutter_application_3/bottom_screens/fourth.dart';
import 'package:flutter_application_3/bottom_screens/second.dart';
import 'package:flutter_application_3/bottom_screens/third.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetxController {
  List<Widget> screens = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    FourthScreen(),
  ];
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.read_more), label: 'Read'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.maps_ugc_rounded), label: 'Message'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  int currentIndex = 0;
  chanagecurrentIndex(index) {
    currentIndex = index;
    update();
  }
}
