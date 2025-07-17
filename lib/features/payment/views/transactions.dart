import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: CustomAppBar(title: 'Transactions', showBackButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'November 20, 2023',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.darkGrey),
              ),
              const Gap(AppSizes.spaceBtwItems),
              Container(
                width: DeviceUtils.getScreenWidth(),
                height: 50,
                padding: const EdgeInsets.all(AppSizes.sm),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
