import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';
import 'package:meal_monkey/modules/home/home_controller.dart';
import 'package:meal_monkey/widgets/bottom_nav_clipper.dart';
import 'package:meal_monkey/widgets/nav_item.dart';

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
          ClipPath(
            clipper: BottomNavClipper(),
            child: PhysicalShape(
              clipper: BottomNavClipper(),
              color: Colors.white,
              elevation: 20,
              shadowColor: Colors.black.withOpacity(0.4),
              child: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavItem(
                      index: 0,
                      label: AppStrings.menu,
                      activeIcon: AssetPath.activeMenu,
                      inactiveIcon: AssetPath.inactiveMenu,
                    ),
                    NavItem(
                      index: 1,
                      label: AppStrings.offers,
                      activeIcon: AssetPath.activeOffers,
                      inactiveIcon: AssetPath.inactiveOffers,
                    ),
                    const SizedBox(width: 45),
                    NavItem(
                      index: 2,
                      label: AppStrings.profile,
                      activeIcon: AssetPath.activeProfile,
                      inactiveIcon: AssetPath.inactiveProfile,
                    ),
                    NavItem(
                      index: 3,
                      label: AppStrings.more,
                      activeIcon: AssetPath.activeMore,
                      inactiveIcon: AssetPath.inactiveMore,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => controller.changeTab(4),
              child: Obx(() {
                final bool isActive = controller.selectedIndex.value == 4;

                return Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade400,
                  ),
                  child: Center(
                    child: Image.asset(
                      isActive ? AssetPath.activeHome : AssetPath.inactiveHome,
                      height: 50,
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
