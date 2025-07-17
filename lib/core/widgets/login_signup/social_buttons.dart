import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/widgets/buttons/custom_button.dart';
import 'package:investment_app/core/widgets/images/responsive_svg_asset.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          iconPosition: IconPosition.left,
          label: 'Sign in with Google',
          icon: const ResponsiveImageAsset(
            assetPath: ImageAssets.googleLogo,
            width: 30,
            height: 30,
          ),
          onPressed: () {},
        ),

        const Gap(AppSizes.spaceBtwItems),
        CustomButton(
          iconPosition: IconPosition.left,
          label: 'Sign in with Apple',
          icon: const ResponsiveImageAsset(
            assetPath: SvgAssets.appleLogo,
            width: 30,
            height: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
