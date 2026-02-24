import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    goToInitialScreen();
  }

  void goToInitialScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(AppRoutes.initialScreen);
  }
}