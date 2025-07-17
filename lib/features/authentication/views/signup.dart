import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/features/authentication/views/login.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/widgets/appbar/appbar.dart';
import '../../../core/widgets/login_signup/form_divider.dart';
import '../../../core/widgets/login_signup/social_buttons.dart';
import '../../../core/widgets/misc/gradient_scaffold.dart';
import '../controllers/signup_controller.dart';
import '../widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return GradientScaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //* title
              Text(
                StringsManager.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Gap(AppSizes.spaceBtwSections),

              //* form
              const SignupForm(),
              const Gap(AppSizes.spaceBtwSections),

              //* divider
              FormDivider(dividerText: StringsManager.orSignUpWith.capitalize!),
              const Gap(AppSizes.spaceBtwItems),

              //* social buttons
              const SocialButtons(),
              const Gap(AppSizes.spaceBtwSections),

              //* already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => Get.off(() => const LoginScreen()),
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
