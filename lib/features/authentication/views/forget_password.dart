import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/constants/text_strings.dart';
import 'package:investment_app/core/utils/validation_utils.dart';
import 'package:investment_app/features/authentication/controllers/forget_password_contorller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* heading
              Text(
                StringsManager.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Gap(AppSizes.spaceBtwItems),
              Text(
                StringsManager.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Gap(AppSizes.spaceBtwSections * 2),

              //* text field
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: ValidationUtils.validateEmail,
                  decoration: const InputDecoration(
                    labelText: StringsManager.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
              ),
              const Gap(AppSizes.spaceBtwSections),

              //* submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text(StringsManager.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
