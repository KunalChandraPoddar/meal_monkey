import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      height: Get.height * 0.12,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
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
                  NavItem(
                    key: ValueKey(0),
                    index: 0,
                    label: AppStrings.menu,
                    activeIcon: AssetPath.activeMenu,
                    inactiveIcon: AssetPath.inactiveMenu,
                  ),
                  NavItem(
                    key: ValueKey(1),
                    index: 1,
                    label: AppStrings.offers,
                    activeIcon: AssetPath.activeOffers,
                    inactiveIcon: AssetPath.inactiveOffers,
                  ),
                  const SizedBox(width: 50),
                  NavItem(
                    key: ValueKey(2),
                    index: 2,
                    label: AppStrings.profile,
                    activeIcon: AssetPath.activeProfile,
                    inactiveIcon: AssetPath.inactiveProfile,
                  ),
                  NavItem(
                    key: ValueKey(3),
                    index: 3,
                    label: AppStrings.more,
                    activeIcon: AssetPath.activeMore,
                    inactiveIcon: AssetPath.inactiveMore,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: -9,
            child: GestureDetector(
              onTap: () => controller.changeTab(4),
              behavior: HitTestBehavior.opaque,
              child: Obx(() {
                final bool isActive = controller.selectedIndex.value == 4;
                return Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.hintTextColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      isActive ? AssetPath.activeHome : AssetPath.inactiveHome,
                      height: 32,
                      width: 32,
                      placeholderBuilder: (context) =>
                          const Icon(Icons.home_filled, color: Colors.orange),
                      colorFilter: ColorFilter.mode(
                        !isActive
                            ? AppColors.appBackgroundColor
                            : AppColors.orangeButtonColor,
                        BlendMode.srcIn,
                      ),
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
