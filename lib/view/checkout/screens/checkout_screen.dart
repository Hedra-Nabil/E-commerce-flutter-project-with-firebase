import 'package:flutter_proj/order%20confirmation/order_confirmation_screen.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/view/checkout/widgets/address_card.dart';
import 'package:flutter_proj/view/checkout/widgets/checkout_bottom_bar.dart';
import 'package:flutter_proj/view/checkout/widgets/order_summary_card.dart';
import 'package:flutter_proj/view/checkout/widgets/payment_method_card.dart';

import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ), //Icon
        ), //IconButton
        title: Text(
          'Checkout',
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ), //Text
      ), //AppBar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Shipping Address'),
            const SizedBox(height: 16),
            const AddressCard(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Payment Method'),
            const SizedBox(height: 16),
            const PaymentMethodCard(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Order Summary'),
            const SizedBox(height: 16),
            const OrderSummaryCard(),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutBottomBar(
        totalAmount: 662.23, // Replace with actual total amount
        onPlaceOrder: () {
          // Handle place order action
          final orderNumber =
              'ORD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

          Get.to(
            () => OrderConfirmationScreen(
              orderNumber: orderNumber,
              totalAmount: 662.23, // Replace with actual total amount
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextstyles.withColor(
        AppTextstyles.h3,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
    );
  }
}
