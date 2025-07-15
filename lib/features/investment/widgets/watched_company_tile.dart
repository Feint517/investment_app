import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/misc/circular_avatar.dart';
import 'package:investment_app/features/investment/models/watched_company_model.dart';

class WatchedCompanyTile extends StatelessWidget {
  const WatchedCompanyTile({super.key, required this.company});

  final WatchedCompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.getScreenWidth(),
      height: 70,
      padding: const EdgeInsets.only(
        top: AppSizes.sm,
        bottom: AppSizes.sm,
        left: AppSizes.sm,
        right: AppSizes.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkerGrey.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          CustomCircularAvatar(imageUrl: company.logo),
          const Gap(AppSizes.md),
          Text(company.name),
          const Spacer(),
          Column(
            children: [
              Text(
                company.value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(AppSizes.xs),
              Row(
                children: [
                  Text(
                    '${company.percentageChange > 0 ? '+' : ''}${company.percentageChange.toStringAsFixed(1)} %',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: company.percentageChange > 0
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
