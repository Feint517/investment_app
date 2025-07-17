import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/widgets/buttons/custom_button.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/investment/controllers/home_controller.dart';
import 'package:investment_app/features/investment/widgets/assets_overview.dart';
import 'package:investment_app/features/investment/widgets/home_app_bar.dart';
import 'package:investment_app/features/investment/widgets/watch_list_section.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GradientScaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(AppSizes.xl),
              const AssetsOverview(),
              const Gap(AppSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      isGradientBackground: true,
                      iconPosition: IconPosition.left,
                      icon: Icon(Iconsax.add_circle, color: AppColors.white),
                      label: 'Deposit',
                    ),
                  ),
                  const Gap(AppSizes.md),
                  Expanded(
                    child: CustomButton(
                      iconPosition: IconPosition.left,
                      icon: Icon(Iconsax.arrow_down, color: AppColors.white),
                      label: 'Withdraw',
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceBtwSections),
              const WatchListSection(),
            ],
          ),
        ),
      ),
    );
  }
}

