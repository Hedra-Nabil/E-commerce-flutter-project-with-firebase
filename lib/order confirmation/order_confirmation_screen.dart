import 'package:flutter_proj/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/view/home_screen.dart';
import 'package:flutter_proj/view/my%20orders/view/screens/my_orders_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String orderNumber;
  final double totalAmount;
  const OrderConfirmationScreen({
    super.key,
    required this.orderNumber,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/order_success.json',
                height: 200,
                width: 200,
                repeat: false,
              ),
              const SizedBox(height: 32),
              Text(
                'Order Confirmed!',
                textAlign: TextAlign.center,
                style: AppTextstyles.withColor(
                  AppTextstyles.h2,
                  isDark ? Colors.white : Colors.black,
                ),
              ), //Text
              const SizedBox(height: 16),
              Text(
                'Your order number is $orderNumber has been successfully placed.',
                textAlign: TextAlign.center,
                style: AppTextstyles.withColor(
                  AppTextstyles.bodyMedium,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ), //Text
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => MyOrdersScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 48,
                  ), //EdgeInsets.symmetric
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ), //RoundedRectangleBorder
                ), //ElevatedButton.styleFrom
                child: Text(
                  'Track Order',
                  style: AppTextstyles.withColor(
                    AppTextstyles.bodyMedium,
                    Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Get.to(() => HomeScreen());
                },
                child: Text(
                  'Continue Shopping',
                  style: AppTextstyles.withColor(
                    AppTextstyles.buttonMeduim,
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ), //Padding
        ), //Scaffold
      ),
    );
  }
}
