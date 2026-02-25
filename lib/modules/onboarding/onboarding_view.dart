import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';
import 'package:meal_monkey/widgets/build_slide.dart';
import 'onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final controller = Get.find<OnboardingController>();

  final List<Map<String, String>> slides = [
    {
      AppStrings.image: AssetPath.slider1Image,
      AppStrings.title: AppStrings.titleSlider1,
      AppStrings.desc: AppStrings.descSlider1,
    },
    {
      AppStrings.image: AssetPath.slider2Image,
      AppStrings.title: AppStrings.titleSlider2,
      AppStrings.desc: AppStrings.descSlider2,
    },
    {
      AppStrings.image: AssetPath.slider3Image,
      AppStrings.title: AppStrings.titleSlider3,
      AppStrings.desc: AppStrings.descSlider3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: slides.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  return BuildSlide(
                    image: slides[index][AppStrings.image]!,
                    title: slides[index][AppStrings.title]!,
                    desc: slides[index][AppStrings.desc]!,
                    index: index,
                    totalSlides: slides.length,
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: controller.nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orangeButtonColor,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  AppStrings.next,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}