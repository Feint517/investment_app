import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/image_utils.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/device_utils.dart';
import '../../../core/widgets/images/responsive_svg_asset.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.asset,
    required this.title,
    required this.subtitle,
  });

  final String asset, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          switch (ImageUtils.getAssetType(asset)) {
            AssetType.image => Image.asset(
              asset,
              width: DeviceUtils.getScreenWidth() * 0.8,
            ),
            AssetType.svg => ResponsiveImageAsset(
              assetPath: asset,
              width: DeviceUtils.getScreenWidth() * 0.8,
              fallbackAspectRatio: 0.3,
            ),
            AssetType.lottie => Lottie.asset(
              asset,
              width: DeviceUtils.getScreenWidth() * 0.8,
              height: DeviceUtils.getScreenHeight() * 0.6,
            ),
          },
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(20),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
