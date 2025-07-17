import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/constants/text_strings.dart';
import 'package:investment_app/core/utils/validation_utils.dart';
import 'package:investment_app/core/widgets/buttons/custom_button.dart';
import 'package:investment_app/features/authentication/controllers/signup_controller.dart';
import 'package:investment_app/features/authentication/views/enter_phone_number.dart';

class SignupForm extends GetView<SignupController> {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.basicInfoFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      ValidationUtils.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: StringsManager.firstName,
                    prefixIcon: Icon(Iconsax.user, color: AppColors.primary),
                  ),
                ),
              ),
              const Gap(AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      ValidationUtils.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: StringsManager.lastName,
                    prefixIcon: Icon(Iconsax.user, color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
          const Gap(AppSizes.spaceBtwInputFields),

          //* username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                ValidationUtils.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: StringsManager.username,
              prefixIcon: Icon(Iconsax.user_edit, color: AppColors.primary),
            ),
          ),
          const Gap(AppSizes.spaceBtwInputFields),

          //* email
          TextFormField(
            controller: controller.email,
            validator: (value) => ValidationUtils.validateEmail(value),
            decoration: const InputDecoration(
              labelText: StringsManager.email,
              prefixIcon: Icon(Iconsax.direct, color: AppColors.primary),
            ),
          ),
          const Gap(AppSizes.spaceBtwInputFields),

          //* password
          Obx(
            //? wrap it with observer to redraw the widget on change
            () => TextFormField(
              controller: controller.password,
              validator: (value) => ValidationUtils.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: StringsManager.password,
                prefixIcon: const Icon(
                  Iconsax.password_check,
                  color: AppColors.primary,
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),
          const Gap(AppSizes.spaceBtwSections),

          //* terms&conditions checkbox
          // const TermsAndConditionsCheckBox(),
          // const Gap(AppSizes.spaceBtwSections),

          //* sign up button
          CustomButton(
            isGradientBackground: true,
            label: StringsManager.sayContinue,
            onPressed: () => Get.to(() => const EnterPhoneNumberScreen()),
          ),
        ],
      ),
    );
  }
}
