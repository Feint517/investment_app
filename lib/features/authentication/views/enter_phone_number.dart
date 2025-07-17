import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/validation_utils.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/buttons/custom_button.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/authentication/controllers/signup_controller.dart';
import 'package:investment_app/features/authentication/views/verify_code.dart';

class EnterPhoneNumberScreen extends GetView<SignupController> {
  const EnterPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: CustomAppBar(showBackButton: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Form(
          key: controller.phoneNumberFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enter your phone number',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Gap(AppSizes.sm),
              Text(
                'Enter phone for verification code.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwSections),
              TextFormField(
                controller: controller.phoneNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: const Icon(Icons.phone, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) => ValidationUtils.validatePhoneNumber(value),
              ),
              const Gap(AppSizes.spaceBtwItems),
              CustomButton(
                isGradientBackground: true,
                label: 'Confirm',
                onPressed: () {
                  if (controller.phoneNumberFormKey.currentState!.validate()) {
                    Get.to(() => const VerifyCodeScreen());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
