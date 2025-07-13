import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/data/repositories/authentication_repository.dart';

import '../../../core/constants/assets_manager.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/utils/device_utils.dart';
import '../../../core/widgets/appbar/appbar.dart';
import '../../../core/widgets/buttons/custom_button.dart';
import '../controllers/verify_email_controller.dart';

class VerifyEmailScreen extends GetView<VerifyEmailController> {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailController());
    final dark = DeviceUtils.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear, color: AppColors.primary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //* image
              Image.asset(
                dark
                    ? ImageAssets.checkEmailAnimatedDark
                    : ImageAssets.checkEmailAnimatedLight,

                width: DeviceUtils.getScreenWidth() * 0.6,
              ),
              const Gap(AppSizes.spaceBtwSections),

              //* title and subtitle
              Text(
                StringsManager.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: AppColors.primary),
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwItems),
              Text(
                StringsManager.confirmEmailSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwSections),

              //* buttons
              CustomButton(
                isGradientBackground: true,
                label: StringsManager.sayContinue,
                onPressed: () => controller.checkEmailVerificationStatus(),
              ),
              const Gap(AppSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(
                    StringsManager.resendEmail,
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
