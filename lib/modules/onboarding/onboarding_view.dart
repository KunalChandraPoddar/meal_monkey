import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';
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
                  return _buildSlide(
                    slides[index][AppStrings.image]!,
                    slides[index][AppStrings.title]!,
                    slides[index][AppStrings.desc]!,
                  );
                },
              ),
            ),

            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: controller.currentIndex.value == index ? 10 : 8,
                    height: controller.currentIndex.value == index ? 10 : 8,
                    decoration: BoxDecoration(
                      color: controller.currentIndex.value == index
                          ? const Color(0xFFFF6C00)
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: controller.nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6C00),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                 AppStrings.next,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildSlide(String image, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 280),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
