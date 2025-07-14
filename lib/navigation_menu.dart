import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/bottom_navigation_bar.dart';
import 'package:investment_app/bottom_navigation_bar_controller.dart';
import 'package:investment_app/core/utils/device_utils.dart';

class NavigationMenu extends GetView<BottomNavController> {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    return Stack(
      children: [
        Obx(() => controller.pages[controller.currentIndex.value]),
        Positioned(
          left: 0,
          right: 0,
          bottom: DeviceUtils.getBottomNavigationBarHeight() / 2,
          child: CustomBottomNavBar(),
        ),
      ],
    );
  }
}
