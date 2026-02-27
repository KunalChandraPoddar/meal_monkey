import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isActive = controller.selectedIndex.value == index;

      return GestureDetector(
        onTap: () => controller.changeTab(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isActive ? activeIcon : inactiveIcon,
              key: ValueKey(isActive),
              height: 15,
              width: 15,
            ),
            Text(
              label,
              style: TextStyle(
                color: isActive
                    ? AppColors.orangeButtonColor
                    : AppColors.hintTextColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}
