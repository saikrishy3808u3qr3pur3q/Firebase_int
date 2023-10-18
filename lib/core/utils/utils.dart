import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';

class Utils {
  static void showErrorSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 500,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: AppColors.white);
  }

  static void showSuccessSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 500,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
        colorText: AppColors.white);
  }

  static void showWarningSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 500,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.yellow,
        colorText: AppColors.white);
  }
}
