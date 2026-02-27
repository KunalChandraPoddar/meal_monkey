import 'package:get/get.dart';
import 'package:meal_monkey/core/constatns/app_strings.dart';
import 'package:meal_monkey/core/constatns/asset_path.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Map<String, dynamic>> allCategories = [
    {
      'title': AppStrings.food,
      'items': AppStrings.foodItemCount,
      'image': AssetPath.foodImage,
    },
    {
      'title': AppStrings.beverages,
      'items': AppStrings.beveragesItemCount,
      'image': AssetPath.beveragesImage,
    },
    {
      'title': AppStrings.desserts,
      'items': AppStrings.dessertsItemCount,
      'image': AssetPath.dessertsImage,
    },
    {
      'title': AppStrings.promotions,
      'items': AppStrings.promotionsItemCount,
      'image': AssetPath.promotionsImage,
    },
    {
      'title': AppStrings.pizzas,
      'items': AppStrings.pizzasItemCount,
      'image': AssetPath.promotionsImage,
    },
    {
      'title': AppStrings.biryani,
      'items': AppStrings.biryaniItemCount,
      'image': AssetPath.promotionsImage,
    },
    {
      'title': AppStrings.resturants,
      'items': AppStrings.resturantsItemCount,
      'image': AssetPath.promotionsImage,
    },
  ];

  var filteredCategories = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredCategories.assignAll(allCategories);
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      filteredCategories.assignAll(allCategories);
    } else {
        final filtered = allCategories.where((category) {
        final title = category['title'].toString().toLowerCase();
        final input = query.toLowerCase();

        return title.startsWith(input);
      }).toList();

      filteredCategories.assignAll(filtered);
    }
  }
}
