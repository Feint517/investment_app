import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/text_strings.dart';
import 'package:investment_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:investment_app/features/authentication/widgets/onboarding_dot_navigation.dart';
import 'package:investment_app/features/authentication/widgets/onboarding_next_button.dart';

import '../../../core/widgets/misc/animated_gradient_scaffold.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());

    return AnimatedGradientScaffold(
      colors: [AppColors.primary, AppColors.accent],
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                asset: ImageAssets.onBoarding1,
                title: StringsManager.onBoardingTitle1,
                subtitle: StringsManager.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                asset: SvgAssets.onBoarding2,
                title: StringsManager.onBoardingTitle2,
                subtitle: StringsManager.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                asset: SvgAssets.onBoarding3,
                title: StringsManager.onBoardingTitle3,
                subtitle: StringsManager.onBoardingSubTitle3,
              ),
            ],
          ),

          //* skip button
          const OnBoardingSkip(),

          //* dot naviagator smoothPageIndicator
          const OnBoardingDotNavigation(),

          //* circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
