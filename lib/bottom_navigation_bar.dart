import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/bottom_navigation_bar_controller.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/utils/colors_utils.dart';
import 'package:investment_app/core/utils/device_utils.dart';

class CustomBottomNavBar extends GetView<BottomNavController> {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Obx(
        () => Center(
          child: Container(
            width: DeviceUtils.getScreenWidth() * 0.75,
            height: 65.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: DeviceUtils.isDarkMode(context)
                    ? [
                        ColorsUtils.makeDarker(
                          AppColors.primary.withValues(alpha: 0.9),
                        ),
                        ColorsUtils.makeDarker(
                          AppColors.accent.withValues(alpha: 0.9),
                        ),
                      ]
                    : [
                        AppColors.primary.withValues(alpha: 0.9),
                        AppColors.accent.withValues(alpha: 0.9),
                      ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(context, Iconsax.home, 0),
                _buildNavItem(context, Iconsax.graph, 1),
                _buildNavItem(context, Icons.person, 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, int index) {
    final isSelected = index == controller.currentIndex.value;
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Expanded(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: (DeviceUtils.getScreenWidth() * 0.75) / 3,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.white,
              size: isSelected ? 28.0 : 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
