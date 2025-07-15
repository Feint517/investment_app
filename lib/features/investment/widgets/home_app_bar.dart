import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/buttons/circular_icon_button.dart';
import 'package:investment_app/features/notifications/views/notification.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Arselene',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Welcome back to .....',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              CircularIconButton(
                icon: Icon(Iconsax.notification, color: Colors.white),
                onTap: () => Get.to(() => const NotificationScreen()),
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
