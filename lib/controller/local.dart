// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:convert';

import 'package:flutter_application_3/Models/user_model.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStroageData extends GetxController {
  //هنا بجيب الداتا بتاع اليوزر وبحفظها في الشيريد برفنسيس

  Future<UserModel?> get getuser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prfes = await SharedPreferences.getInstance();
    var value = prfes.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prfes = await SharedPreferences.getInstance();
    await prfes.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  //بعمل ازاله للداتا لو عملت تسجيل خروج
  void deleteUser() async {
    SharedPreferences prfes = await SharedPreferences.getInstance();
    await prfes.clear();
  }
}
