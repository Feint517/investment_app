import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/features/personalization/models/setting_tile_model.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({super.key, required this.settingTile});

  final SettingTileModel settingTile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (settingTile.destination != null)
          ? Get.to(settingTile.destination)
          : null,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.sm),
        width: DeviceUtils.getScreenWidth(),
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFF08070c),
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
            width: 0.5,
            color: AppColors.white.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          children: [
            ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF161618),
                  ),
                  child: Center(
                    child: Icon(
                      settingTile.icon,
                      size: 23,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(AppSizes.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  settingTile.title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                ),
                Text(
                  settingTile.subtitle,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Iconsax.arrow_right_3,
              size: AppSizes.iconMd,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
