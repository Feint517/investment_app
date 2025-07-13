import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../core/constants/assets_manager.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart' show StringsManager;
import '../../../core/utils/device_utils.dart';
import '../controllers/forget_password_contorller.dart';
import 'login.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //* image with 68% sceen width
              Image(
                image: AssetImage(
                  dark
                      ? ImageAssets.forgotPasswordDark
                      : ImageAssets.forgotPasswordLight,
                ),
                width: DeviceUtils.getScreenWidth() * 0.6,
              ),
              const Gap(AppSizes.spaceBtwSections),

              //* email, title and subtitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwItems),
              Text(
                StringsManager.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwItems),

              Text(
                StringsManager.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwSections),

              //* buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(StringsManager.sayDone),
                ),
              ),
              const Gap(AppSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: const Text(StringsManager.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
