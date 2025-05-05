import 'package:flutter/material.dart';
import 'package:flutter_proj/controllers/theme_controller.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';
import 'package:flutter_proj/view/privacy%20policy/views/screens/terms_of_service_screen.dart';
import 'package:get/get.dart';

import 'privacy policy/views/screens/privacy_policy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
          'Setting',
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            __buildSection(context, 'Appearance', [
              __buildThemeToggle(context),
            ]),
            __buildSection(context, 'Notifications', [
              __buildSwithchTile(
                context,
                'Push Notifications',
                'Receive push Notifications about orders and promotions',
                true,
              ),
              __buildSwithchTile(
                context,
                'Email Notifications',
                'Receive email updates about your orders',
                false,
              ),
            ]),
            __buildSection(context, 'Privacy', [
              __buildNavigationTile(
                context,
                'Privacy Policy',
                'View our privacy policy',
                Icons.privacy_tip_outlined,
                onTap:
                    () => Get.to(
                      () => const PrivacyPolicyScreen(),
                    ), // تصحيح الـ onTap
              ),
              __buildNavigationTile(
                context,
                'Terms of Service',
                'Read our Terms of Service',
                Icons.description_outlined,
                onTap: () => Get.to(() => const TemsOfServiceScreen()),
              ),
            ]),
            __buildSection(context, 'About', [
              __buildNavigationTile(
                context,
                'App Version',
                '1.0.0',
                Icons.info_outline,
                //onTap: () => Get.to(() => const PrivacyPolicyScreen()),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget __buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Text(
            title,
            style: AppTextstyles.withColor(
              AppTextstyles.h3,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget __buildThemeToggle(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<ThemeController>(
      builder:
          (controller) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color:
                      !isDark
                          ? Colors.grey.withOpacity(0.1)
                          : Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: Icon(
                controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Dark Mode',
                style: AppTextstyles.withColor(
                  AppTextstyles.bodyMedium,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              trailing: Switch.adaptive(
                value: controller.isDarkMode,
                onChanged: (Value) => controller.toggleTheme(),
                activeColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
    );
  }

  Widget __buildSwithchTile(
    BuildContext context,
    String title,
    String subtitle,
    bool initialValue,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:
                !isDark
                    ? Colors.grey.withOpacity(0.1)
                    : Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTextstyles.withColor(
            AppTextstyles.bodyMedium,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextstyles.withColor(
            AppTextstyles.bodysmall,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
        ),
        trailing: Switch.adaptive(
          value: initialValue,
          onChanged: (Value) {},
          activeColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget __buildNavigationTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap, // تأكد من أن onTap يتم تنفيذه بشكل صحيح هنا
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color:
                  !isDark
                      ? Colors.grey.withOpacity(0.1)
                      : Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(
            title,
            style: AppTextstyles.withColor(
              AppTextstyles.bodyMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextstyles.withColor(
              AppTextstyles.bodyMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
        ),
      ),
    );
  }
}
