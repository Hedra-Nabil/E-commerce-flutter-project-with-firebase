import 'package:flutter/material.dart';
import 'package:flutter_proj/controllers/navigation_controller.dart';
import 'package:flutter_proj/controllers/theme_controller.dart';
import 'package:flutter_proj/view/account_screen.dart';
import 'package:flutter_proj/view/home_screen.dart';
import 'package:flutter_proj/view/shopping_screen.dart';
import 'package:flutter_proj/view/widgets/custom_bottom_navbar.dart';
import 'package:flutter_proj/view/wishlist_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();

    return GetBuilder<ThemeController>(
      builder:
          (themeController) => Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: AnimatedSwitcher(
              duration: const Duration(microseconds: 200),
              child: Obx(
                () => IndexedStack(
                  key: ValueKey(navigationController.currentIndex.value),
                  index: navigationController.currentIndex.value,
                  children: const [
                    HomeScreen(),
                    ShoppingScreen(),
                    WishlistScreen(),
                    AccountScreen(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const CustomBottomNavbar(),
          ),
    );
  }
}
