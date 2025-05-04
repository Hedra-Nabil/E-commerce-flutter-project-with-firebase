import 'package:flutter/material.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';
import 'package:flutter_proj/view/help%20center/view/widgets/question_card.dart';

class PopularQuaestionsScection extends StatelessWidget {
  const PopularQuaestionsScection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Question',
            style: AppTextstyles.withColor(
              AppTextstyles.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 16),
          const QuestionCard(
            title: 'How to track my order?',
            icon: Icons.local_shipping_outlined,
          ),
          const SizedBox(height: 12),
          const QuestionCard(
            title: 'How to return an item?',
            icon: Icons.local_shipping_outlined,
          ),
        ],
      ),
    );
  }
}
