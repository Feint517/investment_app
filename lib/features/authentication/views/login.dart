import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/widgets/login_signup/social_buttons.dart';

import '../../../core/constants/text_strings.dart';
import '../../../core/styles/spacing_styles.dart';
import '../../../core/widgets/login_signup/form_divider.dart';
import '../../../core/widgets/misc/gradient_scaffold.dart';
import '../controllers/login_controller.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GradientScaffold(
      isFullScreenGradient: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const LoginHeader(),

              const LoginForm(),

              FormDivider(dividerText: StringsManager.orSignInWith.capitalize!),
              const Gap(AppSizes.spaceBtwSections),

              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
