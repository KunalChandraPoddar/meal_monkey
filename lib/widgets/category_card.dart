import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_text_styles.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String items;
  final String title;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.image,
    required this.items,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            top: 25,
            left: 40,
            right: 20,
            child: Container(
              height: 85,
              padding: const EdgeInsets.only(left: 55, right: 50),
              decoration: BoxDecoration(
                color: AppColors.appBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 18,
                    color: Colors.black12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.catogeryCardTitleStyle),
                  const SizedBox(height: 3),
                  Text(items, style: AppTextStyles.catogeryCardItemCountStyle),
                ],
              ),
            ),
          ),

          Positioned(
            top: 26.5,
            left: 0,
            child: Container(
              height: 85,
              width: 85,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(child: SvgPicture.asset(image, fit: BoxFit.cover)),
            ),
          ),

          Positioned(
            top: 53,
            right: 3,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.appBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 12,
                    color: Colors.black12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Center(child: SvgPicture.asset(AssetPath.arrow, height: 14)),
            ),
          ),
        ],
      ),
    );
  }
}
