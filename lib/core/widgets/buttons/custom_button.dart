import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/colors_utils.dart';
import 'package:investment_app/core/utils/device_utils.dart';

enum ButtonSize { small, medium, large }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    required this.label,
    this.icon,
    this.onPressed,
    this.isDisabled = false,
    this.isGradientBackground = false,
    this.size = ButtonSize.small,
    this.iconPosition = IconPosition.right,
  });

  final double? width;
  final String label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final bool isGradientBackground;
  final ButtonSize size;
  final IconPosition iconPosition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width ?? DeviceUtils.getScreenWidth(),
        height: switch (size) {
          ButtonSize.small => 40,
          ButtonSize.medium => 48,
          ButtonSize.large => 56,
        },
        decoration: BoxDecoration(
          gradient: (isGradientBackground && !isDisabled)
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: DeviceUtils.isDarkMode(context)
                      ? [
                          ColorsUtils.makeDarker(AppColors.primary),
                          ColorsUtils.makeDarker(AppColors.accent),
                        ]
                      : [AppColors.primary, AppColors.accent],
                )
              : null,
          color: isDisabled
              ? AppColors.dark.withValues(alpha: 0.7)
              : isGradientBackground
              ? null
              : AppColors.buttonSecondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconPosition == IconPosition.left && icon != null) icon!,
              if (iconPosition == IconPosition.left && icon != null)
                Gap(size == ButtonSize.small ? 4 : 8),
              const Gap(AppSizes.sm),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: switch (size) {
                    ButtonSize.small => 14,
                    ButtonSize.medium => 16,
                    ButtonSize.large => 18,
                  },
                  color: isDisabled ? AppColors.grey : AppColors.white,
                ),
              ),
              const Gap(AppSizes.sm),
              if (iconPosition == IconPosition.right && icon != null)
                Gap(size == ButtonSize.small ? 4 : 8),
              if (iconPosition == IconPosition.right && icon != null) icon!,
            ],
          ),
        ),
      ),
    );
  }
}
