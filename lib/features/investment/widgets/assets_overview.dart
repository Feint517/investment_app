import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/colors_utils.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/features/investment/controllers/home_controller.dart';

class AssetsOverview extends GetView<HomeController> {
  const AssetsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      width: DeviceUtils.getScreenWidth(),
      height: 200,
      decoration: BoxDecoration(
        color: DeviceUtils.isDarkMode(context)
            ? ColorsUtils.makeDarker(AppColors.primary)
            : AppColors.primary,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total asset value',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.grey),
              ),
              GestureDetector(
                child: Icon(Iconsax.graph, color: AppColors.white),
                onTap: () {},
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Text(
                  controller.hideAssetValue.value
                      ? '**********'
                      : '\$18,908.00',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(AppSizes.md),
              Obx(
                () => IconButton(
                  onPressed: () => controller.hideAssetValue.value =
                      !controller.hideAssetValue.value,
                  icon: Icon(
                    controller.hideAssetValue.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                (controller.differencePercentage > 0)
                    ? Iconsax.arrow_up
                    : Iconsax.arrow_down1,
                color: (controller.differencePercentage > 0)
                    ? Colors.green
                    : Colors.red,
              ),
              const Gap(AppSizes.xs),
              Text(
                "${controller.differencePercentage.toString()}%",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: (controller.differencePercentage > 0)
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(AppSizes.xs),
              Text(
                'vs last week',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.grey),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                height: 40,
                width: DeviceUtils.getScreenWidth() * 0.3,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true, drawVerticalLine: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        barWidth: 1,
                        gradient: LinearGradient(
                          colors: [AppColors.secondary, AppColors.white],
                        ),
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.secondary.withValues(alpha: 0.3),
                              AppColors.white.withValues(alpha: 0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        spots: [
                          FlSpot(0, 200),
                          FlSpot(1, 400),
                          FlSpot(2, 300),
                          FlSpot(3, 700),
                          FlSpot(4, 950),
                          FlSpot(5, 1678),
                          FlSpot(6, 1400),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
