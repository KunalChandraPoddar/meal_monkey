import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/routes/app_pages.dart';
import 'package:meal_monkey/app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}