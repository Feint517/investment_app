import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/utils/colors_utils.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/custom_shapes/curved_edges/curved_edges_hill_downwards_widget.dart';

class CustomCurvedHeaderContainer extends StatelessWidget {
  const CustomCurvedHeaderContainer({
    super.key,
    this.child,
    this.backgroundColor = AppColors.backgroundLight,
    this.height = 400,
  });

  final Widget? child;
  final Color backgroundColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgesHillDownwardsWidget(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: DeviceUtils.isDarkMode(context)
                ? [
                    ColorsUtils.makeDarker(AppColors.primary),
                    ColorsUtils.makeDarker(AppColors.accent),
                  ]
                : [AppColors.primary, AppColors.accent],
          ),
        ),
        width: DeviceUtils.getScreenWidth(),
        height: height,
        child: child,
      ),
    );
  }
}
