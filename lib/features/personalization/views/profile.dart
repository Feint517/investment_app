import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/buttons/circular_icon_button.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/personalization/widgets/account_basic_info.dart';
import 'package:investment_app/features/personalization/widgets/account_settings_section.dart';
import 'package:investment_app/features/personalization/widgets/app_settings_section.dart';
import 'package:investment_app/features/personalization/widgets/settings_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: CustomAppBar(
        actions: [CircularIconButton(icon: Icon(Iconsax.logout), onTap: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileHeader(),
            const Gap(AppSizes.spaceBtwSections),
            const AccountBasicInfo(),
            const Gap(AppSizes.spaceBtwSections),

            const AccountSettingsSection(),
            const Gap(AppSizes.spaceBtwSections),
            
            const AppSettingsSection(),
            const Gap(150),
          ],
        ),
      ),
    );
  }
}

