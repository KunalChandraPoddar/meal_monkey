import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/modules/home/home_controller.dart';

class NavItem extends StatelessWidget {
  final int index;
  final String label;
  final String activeIcon;
  final String inactiveIcon;

  NavItem({
    super.key,
    required this.index,
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Obx(() {
        final bool isActive =
            controller.selectedIndex.value == index;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isActive ? activeIcon : inactiveIcon,
              height: 24,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive
                    ? AppColors.orangeButtonColor
                    : AppColors.hintTextColor,
              ),
            ),
          ],
        );
      }),
    );
  }
}