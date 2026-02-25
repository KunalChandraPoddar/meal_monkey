import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';
import 'package:meal_monkey/modules/home/home_controller.dart';
import 'package:meal_monkey/widgets/bottom_nav_clipper.dart';
import 'package:meal_monkey/widgets/nav_item.dart';
import 'nav_shadow_painter.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 80),
            painter: NavShadowPainter(clipper: BottomNavClipper()),
          ),

          ClipPath(
            clipper: BottomNavClipper(),
            child: Container(
              height: 80,
              color: AppColors.appBackgroundColor, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavItem(index: 0, label: AppStrings.menu, activeIcon: AssetPath.activeMenu, inactiveIcon: AssetPath.inactiveMenu),
                  NavItem(index: 1, label: AppStrings.offers, activeIcon: AssetPath.activeOffers, inactiveIcon: AssetPath.inactiveOffers),
                  const SizedBox(width: 50),
                  NavItem(index: 2, label: AppStrings.profile, activeIcon: AssetPath.activeProfile, inactiveIcon: AssetPath.inactiveProfile),
                  NavItem(index: 3, label: AppStrings.more, activeIcon: AssetPath.activeMore, inactiveIcon: AssetPath.inactiveMore),
                ],
              ),
            ),
          ),

          Positioned(
            top: 15,
            child: GestureDetector(
              onTap: () => controller.changeTab(4),
              child: Obx(() {
                final bool isActive = controller.selectedIndex.value == 4;
                return Container(
                  height: 65, width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.hintTextColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      isActive ? AssetPath.activeHome : AssetPath.inactiveHome,
                      height: 32,
                      color: !isActive ? Colors.white : null,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
