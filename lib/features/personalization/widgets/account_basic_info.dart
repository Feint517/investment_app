import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';

class AccountBasicInfo extends StatelessWidget {
  const AccountBasicInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.getScreenWidth(),
      height: 100,
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.8),
            AppColors.primary.withValues(alpha: 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID number',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.white,
                ),
              ),
              Row(
                spacing: AppSizes.sm,
                children: [
                  Text(
                    '1524854984616446',
                    style: Theme.of(context).textTheme.labelLarge
                        ?.copyWith(
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle copy action
                    },
                    child: Icon(
                      Iconsax.copy,
                      color: AppColors.white.withValues(alpha: 0.7),
                      size: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Username',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                'Exodia517',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Account Creation Date',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                '2023-10-01',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}