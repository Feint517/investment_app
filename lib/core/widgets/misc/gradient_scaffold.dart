import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/utils/colors_utils.dart';
import 'package:investment_app/core/utils/device_utils.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({
    super.key,
    this.body,
    this.bottomNavigationBar,
    this.appBar,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.isFullScreenGradient = false,
  });

  final Widget? body;
  final bool isFullScreenGradient;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool extendBodyBehindAppBar;
  final bool extendBody;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //* Gradient Background
        Container(
          width: DeviceUtils.getScreenWidth(),
          height: DeviceUtils.getScreenHeight(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: DeviceUtils.isDarkMode(context)
                  ? [
                      ColorsUtils.makeDarker(AppColors.primary),
                      ColorsUtils.makeDarker(AppColors.accent),
                    ]
                  : [AppColors.primary, AppColors.accent],
              stops: [0.05, 0.3],
            ),
          ),
        ),
        //* Black Overlay Gradient
        if (isFullScreenGradient == false)
          Container(
            width: DeviceUtils.getScreenWidth(),
            height: DeviceUtils.getScreenHeight(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  DeviceUtils.isDarkMode(context)
                      ? AppColors.black
                      : AppColors.backgroundLight,
                  DeviceUtils.isDarkMode(context)
                      ? AppColors.black
                      : AppColors.backgroundLight,
                ],
                stops: [0.0, 0.22, 0.2],
              ),
            ),
          ),
        //* Scaffold Content
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ],
    );
  }
}
