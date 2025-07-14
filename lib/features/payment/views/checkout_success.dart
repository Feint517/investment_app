import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/custom_shapes/container/curved_header_container.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:lottie/lottie.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Checkout'),
      body: Column(
        children: [
          CustomCurvedHeaderContainer(
            height: DeviceUtils.getScreenHeight() * 0.45,
            child: Center(
              child: Text(
                'Thank you!',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  repeat: false,
                  LottieAssets.success,
                  width: DeviceUtils.getScreenWidth() * 0.5,
                  height: DeviceUtils.getScreenHeight() * 0.16,
                ),
                const Gap(AppSizes.spaceBtwItems),
                Text(
                  'Your payment was successful!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
