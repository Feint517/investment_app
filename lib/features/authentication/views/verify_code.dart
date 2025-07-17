// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/authentication/controllers/signup_controller.dart';
import 'package:investment_app/navigation_menu.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeScreen extends GetView<SignupController> {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.grey.withValues(alpha: 0.7),
      ),
    );
    return GradientScaffold(
      appBar: CustomAppBar(showBackButton: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Form(
          key: controller.verificationCodeFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Check your messages',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.sm),
              Text(
                'We have sent a verification code to your phone number.',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.grey),
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwItems),
              Lottie.asset(
                LottieAssets.verificationCode,
                width: DeviceUtils.getScreenWidth(),
                height: 300,
              ),
              const Gap(AppSizes.spaceBtwItems),
              Pinput(
                length: 6,
                controller: controller.verificationCode,
                showCursor: false,
                enableSuggestions: false,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                errorTextStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.primary),
                validator: (pin) {
                  if (pin == '111111') Get.to(() => const NavigationMenu());
                  return 'Pin is incorrect';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
