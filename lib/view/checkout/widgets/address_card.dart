import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

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
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.local_attraction_outlined,
                color: Theme.of(context).primaryColor,
              ), //Icon
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Home',
                      style: AppTextstyles.withColor(
                        AppTextstyles.bodylarge,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '123 Main street, Cityville, ST 12345',
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
                  Icons.edit_outlined,
                  color: Theme.of(context).primaryColor,
                ), //Icon
              ), //IconButton
            ],
          ), //Row
        ],
      ), //Column
    ); //Container
  }
}
