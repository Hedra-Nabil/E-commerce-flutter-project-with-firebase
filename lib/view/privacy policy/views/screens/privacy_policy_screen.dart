import 'package:flutter/material.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';
import 'package:flutter_proj/view/privacy%20policy/views/widget/info_section.dart' show InfoSection;

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'privacy policy',
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection(
                title: 'Information we Collect',
                content:
                    'We collect information that you provide directly to us including name, email address, and shipping information.',
              ),
              InfoSection(
                title: 'How We Use Your Information',
                content:
                    'We use the information we collect to provide , maintain, and improve our service, process your transactions, and send you updates',
              ),
              InfoSection(
                title: 'Information Sharing',
                content:
                    'We collect information that you provide directly to us including name, email address, and shipping information.',
              ),
              InfoSection(
                title: 'Data Security',
                content:
                    'We collect information that you provide directly to us including name, email address, and shipping information.',
              ),
              InfoSection(
                title: 'Your Rights',
                content:
                    'We collect information that you provide directly to us including name, email address, and shipping information.',
              ),
              InfoSection(
                title: 'Cookie information',
                content:
                    'We collect information that you provide directly to us including name, email address, and shipping information.',
              ),
              const SizedBox(height: 24),
              Text(
                'Last update: Marcch 2024',
                style: AppTextstyles.withColor(
                  AppTextstyles.bodysmall,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
