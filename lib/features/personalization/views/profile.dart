import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/buttons/circular_icon_button.dart';
import 'package:investment_app/core/widgets/misc/circular_avatar.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/personalization/views/settings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        actions: [
          CircularIconButton(
            icon: Icon(Iconsax.more, color: Colors.white, size: 24.0),
            onTap: () => Get.to(() => const SettingsScreen()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomCircularAvatar(
              imageUrl: TestAssets.avatar,
              size: AvatarSize.large,
            ),
            const Gap(AppSizes.spaceBtwItems),
            //* User Name
            Text(
              userId,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
            const Gap(AppSizes.spaceBtwSections),
            Row(children: []),
            const Gap(AppSizes.spaceBtwSections * 5),
            const Text(
              'This Profile is under construction',
              style: TextStyle(color: AppColors.white, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
