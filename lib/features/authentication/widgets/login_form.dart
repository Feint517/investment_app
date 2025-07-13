import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/features/authentication/controllers/login_controller.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/utils/validation_utils.dart';
import '../../../core/widgets/buttons/custom_button.dart';
import '../views/forget_password.dart';
import '../views/signup.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            //?Email
            TextFormField(
              controller: controller.email,
              validator: (value) => ValidationUtils.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.direct_right,
                  color: AppColors.primary,
                ),
                labelText: StringsManager.email,
              ),
            ),
            const Gap(AppSizes.spaceBtwInputFields),

            //? password
            Obx(
              //? wrap it with observer to redraw the widget on change
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    ValidationUtils.validateEmptyText('Password', value),
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
            const Gap(AppSizes.spaceBtwInputFields / 2),

            //* remember me and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(StringsManager.rememberMe),
                  ],
                ),

                //* forget password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                  child: const Text(StringsManager.forgetPassword),
                ),
              ],
            ),
            const Gap(AppSizes.spaceBtwSections),

            //* sign in button
            SizedBox(
              width: double.infinity, //? to make the sized button full width
              child: CustomButton(
                isGradientBackground: true,
                label: StringsManager.signIn,
                onPressed: () => controller.emailAndPasswordSignIn(),
              ),
            ),
            const Gap(AppSizes.spaceBtwItems),

            //* create account button
            SizedBox(
              width: double.infinity, //? to make the sized button full width
              child: CustomButton(
                label: StringsManager.createAccount,
                onPressed: () => Get.to(() => const SignupScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
