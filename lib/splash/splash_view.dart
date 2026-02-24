import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';
import 'package:meal_monkey/splash/splash_controller.dart';
import 'package:meal_monkey/core/wrapper/status_bar_wrapper.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return StatusBarWrapper(
      backgroundColor: const Color(0xFFFF6C00),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                AssetPath.splashBackground,
                fit: BoxFit.cover,
              ),
            ),

            Center(child: Image.asset(AssetPath.appLogo, width: 180)),
          ],
        ),
      ),
    );
  }
}
