import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import '../../app/routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  void login() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(AppStrings.error, AppStrings.errorAllFields);
      return;
    }

    isLoading.value = true;

    isLoading.value = false;

    Get.offAllNamed(AppRoutes.home);
  }
}