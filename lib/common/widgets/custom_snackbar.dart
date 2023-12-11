import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void show(
      {required String title,
      required String message,
      Duration duration = const Duration(seconds: 2),
      Color? color}) {
    Get.snackbar(
      title,
      message,
      duration: duration,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color ?? Get.theme.colorScheme.error,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      overlayBlur: 0.0,
      overlayColor: Colors.black.withOpacity(0.5),
      barBlur: 0.5,
    );
  }
}
