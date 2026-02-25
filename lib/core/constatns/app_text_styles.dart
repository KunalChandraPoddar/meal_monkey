import 'package:flutter/material.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';

class AppTextStyles {
  static const TextStyle headTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle mediumTitle = TextStyle(
    fontSize: 16,
    // fontWeight: FontWeight.w500,
    color: AppColors.subHeadingColor,
  );

  static TextStyle hintTextStyle = TextStyle(
    // fontSize: 30,
    color: AppColors.hintTextColor,
  );
}
