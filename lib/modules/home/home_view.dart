import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
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
    const double headerHeight = 160.0; 

    return Scaffold(
      resizeToAvoidBottomInset: true, 
      backgroundColor: AppColors.appBackgroundColor,
      bottomNavigationBar: BottomNav(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: headerHeight,
              child: SvgPicture.asset(
                AssetPath.orangeSideBar,
                height: 450,
                width: 95,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              top: headerHeight,
              left: 0,
              right: 0,
              height: 450,
              child: Obx(() {
                final items = controller.filteredCategories;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CategoryCard(
                      title: item['title'],
                      items: item['items'],
                      image: item['image'],
                      onTap: () {},
                    );
                  },
                );
              }),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: headerHeight,
              child: Container(
                color: AppColors.appBackgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(AppStrings.menuAppbarText, style: AppTextStyles.headTitle),
                        SvgPicture.asset(AssetPath.shoppingCartIcon, height: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetPath.searchIcon, height: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              onChanged: (value) => controller.filterSearchResults(value),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}