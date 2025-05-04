import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

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
            color:
                isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ), //BoxShadow
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/images/mastercard.png', height: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Visa ending in 4242',
                      style: AppTextstyles.withColor(
                        AppTextstyles.bodylarge,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ), //Text
                    const SizedBox(height: 8),
                    Text(
                      'Expires 12/25',
                      style: AppTextstyles.withColor(
                        AppTextstyles.bodysmall,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ), //Text
                  ],
                ), //Column
              ), //Expanded
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ), //Icon
              ), //IconButton
            ],
          ), //Row
        ],
      ),
    ); //Column
  } //Container
}
