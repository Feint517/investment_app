import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/widgets/images/responsive_svg_asset.dart';

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
        const ResponsiveImageAsset(assetPath: ImageAssets.appLogo, height: 60),
        const Gap(AppSizes.sm),
        Text(
          StringsManager.loginTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        
      ],
    );
  }
}
