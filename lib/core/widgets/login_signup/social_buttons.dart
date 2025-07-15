import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/widgets/buttons/circular_icon_button.dart';
import 'package:investment_app/core/widgets/images/responsive_svg_asset.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularIconButton(
          size: 50,
          icon: ResponsiveImageAsset(
            assetPath: ImageAssets.googleLogo,
            width: 80,
          ),
          onTap: () {},
        ),

        const Gap(AppSizes.spaceBtwItems),

        CircularIconButton(
          size: 50,
          icon: ResponsiveImageAsset(
            assetPath: ImageAssets.facebookLogo,
            width: 80,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
