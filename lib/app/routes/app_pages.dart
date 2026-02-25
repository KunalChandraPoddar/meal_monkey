import 'package:get/get.dart';
import 'package:meal_monkey/modules/home/home_binding.dart';
import 'package:meal_monkey/modules/onboarding/onboarding_binding.dart';
import 'package:meal_monkey/modules/onboarding/onboarding_view.dart';
import 'package:meal_monkey/modules/signup/signup_binding.dart';
import 'package:meal_monkey/modules/signup/signup_view.dart';
import 'package:meal_monkey/splash/splash_binding.dart';
import 'package:meal_monkey/splash/splash_view.dart';
import '../../modules/initial_screen/initial_screen_view.dart';
import '../../modules/initial_screen/initial_screen_binding.dart';
import '../../modules/login/login_view.dart';
import '../../modules/login/login_binding.dart';
import '../../modules/home/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.initialScreen,
      page: () => InitialScreenView(),
      binding: InitialScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
