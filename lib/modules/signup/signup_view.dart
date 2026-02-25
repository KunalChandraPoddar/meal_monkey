import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/routes/app_routes.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/app_text_styles.dart';
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
            backgroundColor: AppColors.appBackgroundColor,
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
                        style: AppTextStyles.headTitle,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        AppStrings.signUPPageHeadText,
                        style: AppTextStyles.mediumTitle,
                      ),

                      const SizedBox(height: 30),

                      TextAreaRoundedField(
                        controller: controller.emailController,
                        hint: AppStrings.emailAddressHint,
                        obscure: false,
                      ),

                      const SizedBox(height: 25),

                      TextAreaRoundedField(
                        controller: controller.passwordController,
                        hint: AppStrings.passwordHint,
                        obscure: true,
                      ),

                      const SizedBox(height: 25),

                      TextAreaRoundedField(
                        controller: controller.confirmPasswordController,
                        hint: AppStrings.confirmPasswordHint,
                        obscure: true,
                      ),

                      const SizedBox(height: 25),

                      Obx(
                        () => SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: AppButton(
                            text: controller.isLoading.value
                                ? AppStrings.signingUp
                                : AppStrings.signUp,
                            backgroundColor: AppColors.orangeButtonColor,
                            textColor: AppColors.orangeButtonTextColor,
                            onPressed: controller.signup,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.alreadyAccount,
                            style: AppTextStyles.mediumTitle,
                          ),
                          GestureDetector(
                            onTap: controller.goToLogin,
                            child: Text(
                              AppStrings.login,
                              style: TextStyle(
                                color: AppColors.orangeButtonColor,
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
