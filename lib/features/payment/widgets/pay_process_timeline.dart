import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:timelines_plus/timelines_plus.dart';

class PayProcessTimeline extends StatelessWidget {
  const PayProcessTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceUtils.getScreenWidth(),
      height: DeviceUtils.getScreenHeight() * 0.1,
      child: Timeline.tileBuilder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        builder: TimelineTileBuilder.connected(
          itemCount: 3,
          contentsAlign: ContentsAlign.basic,
          contentsBuilder: (context, index) {
            return SizedBox(
              width: (DeviceUtils.getScreenWidth() - (AppSizes.md * 2)) / 3,
            );
          },
          indicatorBuilder: (context, index) {
            List<Widget> icons = [
              Icon(Iconsax.document, color: AppColors.primary),
              Icon(Iconsax.card, color: AppColors.primary),
              Icon(Iconsax.check, color: AppColors.primary),
            ];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: icons[index],
            );
          },
          connectionDirection: ConnectionDirection.after,
          connectorBuilder: (context, index, type) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (dotIndex) {
                return Container(
                  width: 4,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withValues(
                      alpha: 0.5,
                    ), // Dot color
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
