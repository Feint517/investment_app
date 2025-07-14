import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/colors_utils.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/images/responsive_svg_asset.dart';
import 'package:investment_app/core/widgets/layouts/grid_layout.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/investment/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(AppSizes.xl),
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 2000,
                    gridData: FlGridData(show: true, drawVerticalLine: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,

                          interval: 1000,
                        ),
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
                        color: AppColors.accent,
                        shadow: Shadow(color: AppColors.accent),
                        dotData: FlDotData(show: false),
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
              const Gap(AppSizes.spaceBtwSections),
              CustomGridLayout(
                mainAxisExtent: 100,
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<Widget> widgets = [
                    const HomeCategorySection(
                      icon: Iconsax.add_circle,
                      iconColor: AppColors.primary,
                      title: '9.55',
                      category: 'Pockets',
                    ),
                    const HomeCategorySection(
                      icon: Iconsax.graph,
                      iconColor: AppColors.secondary,
                      title: '133.28',
                      category: 'Investments',
                    ),
                    const HomeCategorySection(
                      icon: Iconsax.add,
                      iconColor: AppColors.grey,
                      title: 'Pension',
                      category: null,
                    ),
                    const HomeCategorySection(
                      icon: Iconsax.add,
                      iconColor: AppColors.grey,
                      title: 'Card',
                      category: null,
                    ),
                  ];
                  return widgets[index];
                },
              ),
              const Gap(AppSizes.spaceBtwSections),
              Text(
                'Portfolio Positions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(AppSizes.spaceBtwItems),
              InsvestmentStat(
                imageUrl: TestAssets.companyLogo1,
                companyName: 'Biso Na Biso',
                position: '1st by 275.84',
                price: '275.84',
                percentageChange: 1.5,
              ),
              const Gap(AppSizes.spaceBtwItems),
              InsvestmentStat(
                imageUrl: TestAssets.companyLogo2,
                companyName: 'GICODIS',
                position: '1st by 275.84',
                price: '275.84',
                percentageChange: -20,
              ),
              const Gap(AppSizes.spaceBtwItems),
              InsvestmentStat(
                imageUrl: TestAssets.companyLogo3,
                companyName: 'Beltexco',
                position: '1st by 275.84',
                price: '275.84',
                percentageChange: 1.5,
              ),
              const Gap(AppSizes.spaceBtwItems),
              const Gap(150),
            ],
          ),
        ),
      ),
    );
  }
}

class InsvestmentStat extends StatelessWidget {
  const InsvestmentStat({
    super.key,
    required this.imageUrl,
    required this.companyName,
    required this.position,
    required this.price,
    required this.percentageChange,
  });

  final String imageUrl;
  final String companyName;
  final String position;
  final String price;
  final double percentageChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.getScreenWidth(),
      height: 80,
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.darkerGrey.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Image.asset(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
          const Gap(AppSizes.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(AppSizes.sm),
              Text(
                companyName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(AppSizes.xs),
              Text(
                position,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: AppColors.grey),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(
                price,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(AppSizes.xs),
              Text(
                "${percentageChange > 0 ? '+' : ''}$percentageChange %",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: percentageChange > 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.category,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.sm),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
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
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 25.0),
          const Gap(AppSizes.md),
          if (category != null)
            Text(
              category!,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: AppColors.grey),
            ),
          Spacer(),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
