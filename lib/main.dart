import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/controllers/auth_controller.dart';
import 'package:flutter_proj/controllers/navigation_controller.dart';
import 'package:flutter_proj/controllers/theme_controller.dart';
import 'package:flutter_proj/utils/app_themes.dart';
import 'package:flutter_proj/view/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  Get.put(ThemeController());
  //Get.put(AuthController());
  Get.put(NavigationController());
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Store',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
      home: SplashScreen(),
      //home: const MainScreen(),
    );
  }
}
