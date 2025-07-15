import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/buttons/circular_icon_button.dart';

//? we created custom appbar because normal appbar doesn't support padding
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.backArrowColor,
    this.actions,
    this.leadingOnPressed,
  });

  final String? title;
  final bool showBackArrow;
  final Color? backArrowColor;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: SizedBox(
          height: DeviceUtils.getAppBarHeight(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Back Arrow or Leading Icon
              if (showBackArrow)
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircularIconButton(
                    icon: Icon(
                      Iconsax.arrow_left,
                      color: backArrowColor ?? AppColors.white,
                      size: 24.0,
                    ),
                    onTap: () => Get.back(),
                  ),
                ),

              // Title in the Center
              if (title != null)
                Center(
                  child: Text(
                    title!,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: AppColors.white),
                    textAlign: TextAlign.center,
                  ),
                ),

              // Actions on the Right
              if (actions != null && actions!.isNotEmpty)
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
