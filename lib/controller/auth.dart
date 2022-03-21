// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/Models/user_model.dart';
import 'package:flutter_application_3/Screens/login.dart';
import 'package:flutter_application_3/Services/fire_store.dart';
import 'package:flutter_application_3/bottom_screens/home_layout.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  String? email, password, name, selectedItem;
  var resetEmail = TextEditingController();
  var isLoading = false.obs;
  RxBool isPassword = true.obs;
  var isChecked = false.obs;
  var isProfilePickedPath = false.obs;
  var profilePickedPath = "".obs;
  String? imagePath;
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
          .then((value) => Get.snackbar(
              'Successfully Login', 'Welcome In Our App',
              snackPosition: SnackPosition.BOTTOM));
      Get.offAll(const HomeLayOut(), transition: Transition.leftToRight);
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
      Get.snackbar('Successfully Login', 'Welcome $name',
          snackPosition: SnackPosition.BOTTOM);
      Get.offAll(const HomeLayOut(), transition: Transition.leftToRight);
    } on FirebaseException catch (e) {
      Get.snackbar('Error Login Account', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void ForgetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) async {
        Get.to(SignIn(), transition: Transition.leftToRight);
      });
      Get.snackbar('Successfully Reseted', 'password Reset Email Sent');
    } on FirebaseException catch (e) {
      Get.snackbar('Faild Reset Password', e.message.toString());
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

  //Loading CircleProgress In Press Login
  void loadCircleProgress() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
  }

//CHEACK BOX
  OnPageChanged(bool value) {
    isChecked.value = value;
  }

  //IMAGE PICKER
  void pickedPath(String path) {
    profilePickedPath.value = path;
    isProfilePickedPath.value = true;
  }
}
