import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
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
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 320,
                  child: Image.asset(AssetPath.appLogo, height: 155),
                ),
              ],
            ),

            const SizedBox(height: 70),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                AppStrings.initialScreenParagraph,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  AppButton(
                    text: AppStrings.login,
                    backgroundColor: const Color(0xFFFF6C00),
                    textColor: Colors.white,
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                  ),
                  const SizedBox(height: 15),
                  AppButton(
                    text: AppStrings.createAccount,
                    isOutlined: true,
                    backgroundColor: const Color(0xFFFF6C00),
                    textColor: const Color(0xFFFF6C00),
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
