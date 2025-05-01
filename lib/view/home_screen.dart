import 'package:flutter/material.dart';
import 'package:flutter_proj/controllers/theme_controller.dart';
import 'package:flutter_proj/view/all_products_screen.dart';
import 'package:flutter_proj/view/cart_screen.dart';
import 'package:flutter_proj/view/widgets/category_chips.dart';
import 'package:flutter_proj/view/widgets/custom_search_bar.dart';
import 'package:flutter_proj/view/widgets/product_grid.dart';
import 'package:flutter_proj/view/widgets/sale_banner.dart';
import 'package:get/get.dart';

import 'notifications/view/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // header section
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Alex',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  // notification icon
                  IconButton(
                    onPressed: () => Get.to(() =>  NotificationsScreen()),
                    icon: Icon(Icons.notifications_outlined),
                  ),
                  // cart button
                  IconButton(
                    onPressed: () => Get.to(() => const CartScreen()),
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                  // theme button
                  GetBuilder<ThemeController>(
                    builder:
                        (controller) => IconButton(
                          onPressed: () => controller.toggleTheme(),
                          icon: Icon(
                            controller.isDarkMode
                                ? Icons.light_mode
                                : Icons.dark_mode,
                          ),
                        ),
                  ),
                ],
              ),
            ),
            // search bar
            const CustomSearchBar(),

            //category chips
            const CategoryChips(),

            // sale banner
            const SaleBanner(),
            // popular product
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Product',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const AllProductsScreen()),
                    child: Text(
                      'See All',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),

            // product grid
            const Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
