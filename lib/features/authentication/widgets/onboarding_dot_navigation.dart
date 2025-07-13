import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:investment_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/utils/device_utils.dart';

class OnBoardingDotNavigation extends GetView<OnBoardingController> {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: DeviceUtils.isDarkMode(context)
              ? AppColors.light
              : AppColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
