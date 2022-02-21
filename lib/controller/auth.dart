// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/user_model.dart';
import 'package:flutter_application_3/Services/fire_store.dart';
import 'package:flutter_application_3/bottom_screens/home_layout.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  String? email, password, name, selectedItem;

  FirebaseAuth auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();
  //عشان اعرض قيمه اليوزر
  String? get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    //هنا لو حصل اي تغيير من اي حاجه بعمل تسجيل دخول بيها هتسمع هنا
    _user.bindStream(auth.authStateChanges());
  }

  void SignInWithEmailAndPassword() async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) => print(value));
      Get.offAll(const HomeLayOut());
    } on FirebaseException catch (e) {
      print(e.message);
      Get.snackbar('Error Login Account', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void CreateAccountWithEmailAndPassword() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(const HomeLayOut());
    } on FirebaseException catch (e) {
      print(e);
      Get.snackbar('Error Login Account', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFirestore(UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name,
      selectedItem: item,
      pic: '',
    ));
  }

//Suffix Icon
  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;
  changeSuffix() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    update();
  }

//DrobDownButton
  String? item;
  List<String> items = [
    'First Level',
    'Second Level',
    'Third Level',
    'Fourth Level',
  ];
  void ChangeSelected(value) {
    item = value;
  }
}
