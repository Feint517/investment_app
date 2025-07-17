import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/constants/text_strings.dart';
import 'package:investment_app/core/styles/spacing_styles.dart';
import 'package:investment_app/core/widgets/login_signup/form_divider.dart';
import 'package:investment_app/core/widgets/login_signup/social_buttons.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/authentication/controllers/login_controller.dart';
import 'package:investment_app/features/authentication/views/signup.dart';
import 'package:investment_app/features/authentication/widgets/login_form.dart';
import 'package:investment_app/features/authentication/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GradientScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginHeader(),

              const LoginForm(),

              FormDivider(dividerText: StringsManager.orSignInWith.capitalize!),
              const Gap(AppSizes.spaceBtwSections),

              const SocialButtons(),
              const Gap(AppSizes.spaceBtwSections),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => Get.off(() => const SignupScreen()),
                    child: Text(
                      'Sign up',
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
