import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/routes/app_routes.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/widgets/app_button.dart';
import 'package:meal_monkey/core/wrapper/status_bar_wrapper.dart';
import 'signup_controller.dart';
import '../../widgets/text_area_rounded_field.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final controller = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          Get.offAllNamed(AppRoutes.initialScreen);
        },
        child: StatusBarWrapper(
          backgroundColor: AppColors.appBackgroundColor,
          child: Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        AppStrings.signUp,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        AppStrings.signUPPageHeadTExt,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),

                      const SizedBox(height: 30),

                      TextAreaRoundedField(
                        controller: controller.emailController,
                        hint: AppStrings.emailAddressHint,
                        obscure: false,
                      ),

                      const SizedBox(height: 20),

                      TextAreaRoundedField(
                        controller: controller.passwordController,
                        hint: AppStrings.passwordHint,
                        obscure: true,
                      ),

                      const SizedBox(height: 20),

                      TextAreaRoundedField(
                        controller: controller.confirmPasswordController,
                        hint: AppStrings.confirmPasswordHint,
                        obscure: true,
                      ),

                      const SizedBox(height: 20),

                      Obx(
                        () => SizedBox(
                          width: double.infinity,
                          height: 55,
                          child:
                              AppButton(
                                text: controller.isLoading.value
                                    ? AppStrings.signingUp
                                    : AppStrings.signUp,
                                backgroundColor: const Color(0xFFFF6C00),
                                textColor: Colors.white,
                                onPressed: controller.signup,
                              ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppStrings.alreadyAccount),
                          GestureDetector(
                            onTap: controller.goToLogin,
                            child: const Text(
                              AppStrings.login,
                              style: TextStyle(
                                color: Color(0xFFFF6C00),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
