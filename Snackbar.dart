import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Common/Common color.dart';


class StackDialog {
  static Future show(
      String? header, String? body, IconData? icon, Color? color) async {
    return Get.snackbar(
      margin:const EdgeInsets.only(top:10.0,left:8.0,right: 8.0),
      backgroundColor: Colors.white,
      borderColor: primarycolor,
      borderWidth: 2,
      maxWidth: 400,
      header!,
      body!,
      icon: Icon(icon, color: color),
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
    );
  }
}