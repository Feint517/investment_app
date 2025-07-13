import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/assets_manager.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(height: 150, image: AssetImage(ImageAssets.appLogo)),

        Text(
          StringsManager.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Gap(AppSizes.sm),
        Text(
          StringsManager.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
