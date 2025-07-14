import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/buttons/circular_icon_button.dart';
import 'package:investment_app/core/widgets/buttons/custom_button.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/personalization/widgets/accounts_settings_scetion.dart';
import 'package:investment_app/features/personalization/widgets/app_settings_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: CustomAppBar(title: 'Settings', showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(AppSizes.spaceBtwSections),
              const AccountSettingsSection(),

              const Gap(AppSizes.spaceBtwSections),
              const AppSettingsSection(),

              const Gap(AppSizes.spaceBtwSections),
              CustomButton(
                isGradientBackground: true,
                label: 'Logout',
                size: ButtonSize.medium,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
