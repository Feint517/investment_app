import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/widgets/misc/circular_avatar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomCircularAvatar(
          imageUrl: TestAssets.avatar,
          size: AvatarSize.large,
        ),
        const Gap(AppSizes.md),
        Text(
          'Arselene',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'arselene.dev@gmail.com',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
