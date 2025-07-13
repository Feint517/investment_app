import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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
      appBar: CustomAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Gap(AppSizes.spaceBtwSections),

              //* social buttons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
