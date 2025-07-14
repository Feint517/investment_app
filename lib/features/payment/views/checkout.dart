import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:timelines_plus/timelines_plus.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: CustomAppBar(title: 'Checkout', showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: DeviceUtils.getScreenWidth(),
              height: DeviceUtils.getScreenHeight() * 0.25,
              child: Timeline.tileBuilder(
                physics: NeverScrollableScrollPhysics(),
                theme: TimelineThemeData(
                  direction: Axis.horizontal,
                  nodePosition: 0.5,
                  connectorTheme: ConnectorThemeData(thickness: 6.0, indent: 3),
                  indicatorTheme: IndicatorThemeData(position: 0.5, size: 60.0),
                ),
                builder: TimelineTileBuilder.connected(
                  connectionDirection: ConnectionDirection.after,
                  itemCount: 3,
                  indicatorBuilder: (context, index) {
                    final icons = [
                      Iconsax.play,
                      Iconsax.card,
                      Iconsax.tick_circle,
                    ];
                    final isActive = index == 0;
                    final isCompleted = false;
                    return Icon(
                      icons[index],
                      color: isActive || isCompleted
                          ? AppColors.primary
                          : AppColors.darkGrey,
                    );
                  },
                  connectorBuilder: (context, index, type) {
                    type = ConnectorType.end;
                    return Row(
                      children: List.generate(6, (index) {
                        return Container(
                          width: 4,
                          height: 4,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grey.withValues(alpha: 0.3),
                          ),
                        );
                      }),
                    );
                    // return DotIndicator(
                    //   size: 8.0,
                    //   color: AppColors.primary,
                    //   position: 0.5,
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
