import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(AppRoutes.home);
    }
  }
}