import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_text_styles.dart';
import '../modules/onboarding/onboarding_controller.dart';

class BuildSlide extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final int index;
  final int totalSlides;

  BuildSlide({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.index,
    required this.totalSlides,
  });

  final controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 280),

          const SizedBox(height: 25),

          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalSlides,
                (dotIndex) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentIndex.value == dotIndex ? 10 : 8,
                  height: controller.currentIndex.value == dotIndex ? 10 : 8,
                  decoration: BoxDecoration(
                    color: controller.currentIndex.value == dotIndex
                        ? const Color(0xFFFF6C00)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.headTitle,
          ),

          const SizedBox(height: 30),

          Text(
            desc,
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumTitle,
          ),
        ],
      ),
    );
  }
}
