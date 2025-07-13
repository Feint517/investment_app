import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/features/authentication/controllers/onboarding_controller.dart';

class OnBoardingSkip extends GetView<OnBoardingController> {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: AppSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: const Text("Skip", style: TextStyle(color: AppColors.white)),
      ),
    );
  }
}
