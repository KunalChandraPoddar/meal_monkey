import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import '../../app/routes/app_routes.dart';

class SignupController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;

  void signup() async {

    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {

      Get.snackbar(AppStrings.error, AppStrings.errorAllFields);
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(AppStrings.error, AppStrings.passwordNotMatch);
      return;
    }

    isLoading.value = true;

    isLoading.value = false;

    Get.offAllNamed(AppRoutes.onboarding);
  }

  void goToLogin() {
    Get.toNamed(AppRoutes.login);
  }
}