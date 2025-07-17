import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/features/investment/controllers/home_controller.dart';
import 'package:investment_app/features/investment/views/edit_watchlist.dart';
import 'package:investment_app/features/investment/widgets/watched_company_tile.dart';

class WatchListSection extends GetView<HomeController> {
  const WatchListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Watchlist',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (controller.watchedCompanies.isNotEmpty)
              GestureDetector(
                onTap: () => Get.to(() => const EditWatchlist()),
                child: Text(
                  'Edit Watchlist',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.darkGrey),
                ),
              ),
          ],
        ),
        const Gap(AppSizes.spaceBtwItems),
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.watchedCompanies.length,
            itemBuilder: (context, index) {
              final company = controller.watchedCompanies[index];
              return WatchedCompanyTile(company: company);
            },
            separatorBuilder: (context, index) => const Gap(AppSizes.md),
          ),
        ),
      ],
    );
  }
}
