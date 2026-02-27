import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/app_text_styles.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';
import 'package:meal_monkey/widgets/app_button.dart';
import '../../app/routes/app_routes.dart';
import 'initial_screen_controller.dart';

class InitialScreenView extends StatelessWidget {
  InitialScreenView({super.key});

  final controller = Get.find<InitialScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      backgroundColor: AppColors.appBackgroundColor,
      body: SizedBox.expand(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    child: Image.asset(
                      AssetPath.intialPageOrangeTopImage,
                      height: MediaQuery.of(context).size.height * 0.6, 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: MediaQuery.of(context).size.height * 0.38, 
                  child: Image.asset(AssetPath.appLogo, height: 155),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                AppStrings.initialScreenParagraph,
                textAlign: TextAlign.center,
                style: AppTextStyles.mediumTitle,
              ),
            ),

            const SizedBox(height: 80),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  AppButton(
                    text: AppStrings.login,
                    backgroundColor: AppColors.orangeButtonColor,
                    textColor: AppColors.orangeButtonTextColor,
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                  ),
                  const SizedBox(height: 15),
                  AppButton(
                    text: AppStrings.createAccount,
                    isOutlined: true,
                    backgroundColor: AppColors.orangeButtonColor,
                    textColor: AppColors.whiteButtonTExtColor,
                    onPressed: () {
                      Get.toNamed(AppRoutes.signup);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
