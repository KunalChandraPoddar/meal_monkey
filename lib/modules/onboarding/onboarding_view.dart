import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';
import 'package:meal_monkey/widgets/app_button.dart';
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
        child: Stack(
          children: [
            PageView.builder(
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

            Positioned(
              top: MediaQuery.of(context).size.height * 0.47,
              left: 0,
              right: 0,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    slides.length,
                    (dotIndex) => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: controller.currentIndex.value == dotIndex ? 9 : 9,
                      height: controller.currentIndex.value == dotIndex
                          ? 9
                          : 9,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == dotIndex
                            ? AppColors.orangeButtonColor
                            : AppColors.sliderCircleColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 120,
              left: 40,
              right: 40,
              child: AppButton(
                text: AppStrings.next,
                onPressed: controller.nextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
