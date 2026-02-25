import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_colors.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/app_text_styles.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';
import 'package:meal_monkey/widgets/category_card.dart';
import 'home_controller.dart';
import '../../widgets/bottom_nav.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appBackgroundColor,
      bottomNavigationBar: BottomNav(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 150,
              child: Image.asset(
                AssetPath.orangeSideBar,
                height: 490,
                width: 95,
                fit: BoxFit.fill,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.menuAppbarText,
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),

                      Image.asset(
                        AssetPath.shoppingCartIcon,
                        height: 26,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Image.asset(AssetPath.searchIcon, height: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: AppStrings.searchFoodHintText,
                              hintStyle: AppTextStyles.hintTextStyle,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Expanded(
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CategoryCard(
                          title: AppStrings.food,
                          items: AppStrings.foodItemCount,
                          image: AssetPath.foodImage,
                          onTap: () {},
                        ),
                        CategoryCard(
                          title: AppStrings.beverages,
                          items: AppStrings.beveragesItemCount,
                          image: AssetPath.beveragesImage,
                          onTap: () {},
                        ),
                        CategoryCard(
                          title: AppStrings.desserts,
                          items: AppStrings.dessertsItemCount,
                          image: AssetPath.dessertsImage,
                          onTap: () {},
                        ),
                        CategoryCard(
                          title: AppStrings.promotions,
                          items: AppStrings.promotionsItemCount,
                          image: AssetPath.promotionsImage,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
