import 'dart:convert';

import 'package:flutter_application_3/Services/sharedprefrences.dart';
import 'package:flutter_application_3/alerts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class Api {
  static const String _baseUrl = 'https://radiant-falls-92419.herokuapp.com';

  static Future<Map<String, String>> _getHeaders() async {
    final token = await SharedPrefrencesStorage.getSavedToken();
    return {"Accept": "application/json", "Authorization": "Bearer $token"};
  }

  static Future<Map> loginStudent(
    String email,
    String password, {
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await post(
          Uri.parse(
              _baseUrl + '/api/student/login?email=$email&password=$password'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        String token = parsed['token'];
        await SharedPrefrencesStorage.saveToken(token);
        return parsed;
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> changeStudentPassword(
    String newPassword, {
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await post(
          Uri.parse('/api/student/change-password?password=$newPassword'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed;
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }
}
