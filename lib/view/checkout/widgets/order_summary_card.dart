import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark 
            ? Colors.black.withOpacity(0.2) 
            : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ), 
      child: Column(
        children: [
          _buildSummaryRow(context,'Subtotal','\$599.93'),
          const SizedBox(height: 8),
          _buildSummaryRow(context,'Shipping','\$10.00'),
          const SizedBox(height: 8),
          _buildSummaryRow(context,'Tax','\$53.00'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12,),
            child: Divider(),
          ), //Padding
          _buildSummaryRow(context,'Total','\$662.10', isTotal: true),
        ]
      )
    ); //Container
}
  Widget _buildSummaryRow(BuildContext context, String label, String value,{bool isTotal = false}){
    final textStyle = isTotal ? AppTextstyles.h3 : AppTextstyles.bodylarge;
    final color = isTotal ?
    Theme.of(context).primaryColor :
    Theme.of(context).textTheme.bodyLarge!.color!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextstyles.withColor(textStyle, color),
        ), //Text
        Text(
          value,
          style: AppTextstyles.withColor(textStyle, color),
        ), //Text
      ]
    );
  }
}