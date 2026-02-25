import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/routes/app_routes.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/app_text_styles.dart';
import 'package:meal_monkey/widgets/app_button.dart';
import 'package:meal_monkey/widgets/text_area_rounded_field.dart';
import 'package:meal_monkey/core/wrapper/status_bar_wrapper.dart';
import 'login_controller.dart';

class LoginView extends StatelessWidget {
  final controller = Get.find<LoginController>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Get.offAllNamed(AppRoutes.initialScreen);
        },
        child: StatusBarWrapper(
          backgroundColor: AppColors.appBackgroundColor,

          child: Scaffold(
            backgroundColor: AppColors.appBackgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),

                      const Text(
                        AppStrings.login,
                        style: AppTextStyles.headTitle,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        AppStrings.loginPageHeadText,
                        style: AppTextStyles.mediumTitle,
                      ),

                      const SizedBox(height: 40),

                      TextAreaRoundedField(
                        controller: controller.emailController,
                        hint: AppStrings.emailHint,
                        obscure: false,
                      ),

                      const SizedBox(height: 25),

                      TextAreaRoundedField(
                        controller: controller.passwordController,
                        hint: AppStrings.passwordHint,
                        obscure: true,
                      ),

                      const SizedBox(height: 40),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: AppButton(
                          text: controller.isLoading.value
                              ? AppStrings.controllerLoadingText
                              : AppStrings.login,
                          backgroundColor: AppColors.orangeButtonColor,
                          textColor: AppColors.orangeButtonTextColor,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        AppStrings.frogotPassWord,
                        style: AppTextStyles.mediumTitle,
                      ),

                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.noaccountText,
                            style: AppTextStyles.mediumTitle,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.signup);
                            },
                            child: Text(
                              AppStrings.signUp,
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
