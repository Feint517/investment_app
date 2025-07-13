import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/utils/device_utils.dart';
import '../controllers/onboarding_controller.dart';

class OnBoardingNextButton extends GetView<OnBoardingController> {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);

    return Positioned(
      right: AppSizes.defaultSpace,
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => controller.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? AppColors.primary : Colors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
