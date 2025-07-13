import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/constants/text_strings.dart';
import 'package:investment_app/core/styles/spacing_styles.dart';
import 'package:investment_app/core/widgets/buttons/custom_button.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.image,
  });

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Lottie.asset(
                image,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const Gap(AppSizes.spaceBtwSections),

              //* title and subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwItems),

              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(AppSizes.spaceBtwSections),

              CustomButton(
                isGradientBackground: true,
                label: StringsManager.sayContinue,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
