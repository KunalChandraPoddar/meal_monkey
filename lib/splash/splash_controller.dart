import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _initApp();
  }

  void _initApp() async {
    await Future.delayed(const Duration(seconds: 2));

    FlutterNativeSplash.remove(); 

    Get.offAllNamed(AppRoutes.onboarding);
  }
}