// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant/const.dart';

class DefaultFormField extends StatelessWidget {
  DefaultFormField({
    Key? key,
    this.controller,
    required this.validator,
    required this.type,
    required this.icon,
    required this.onSave,
    this.suffixPress,
    this.isPassword = false,
    this.suffix,
  }) : super(key: key);
  TextInputType type;
  TextEditingController? controller;
  IconData icon;
  IconData? suffix;
  Function? suffixPress;
  Function onSave;
  FormFieldValidator validator;
  bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      onSaved: (s) {
        onSave(s);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: aprimary),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              suffixPress!();
            },
            icon: Icon(
              suffix,
              color: Colors.grey,
            )),
        fillColor: Colors.blue[50],
        filled: true,
      ),
    );
  }
}
