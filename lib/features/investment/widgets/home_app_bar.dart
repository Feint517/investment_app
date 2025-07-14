import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/buttons/circular_icon_button.dart';
import 'package:investment_app/core/widgets/misc/circular_avatar.dart';
import 'package:investment_app/features/personalization/views/profile.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: SizedBox(
          height: AppSizes.appBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomCircularAvatar(
                size: AvatarSize.small,
                imageUrl: TestAssets.avatar,
                onTap: () =>
                    Get.to(() => const ProfileScreen(userId: 'Arselene')),
              ),
              // CircularIconButton(
              //   icon: Icon(
              //     Iconsax.notification,
              //     color: Colors.white,
              //     size: 24.0,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
