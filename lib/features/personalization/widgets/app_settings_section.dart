import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/features/personalization/widgets/settings_menu_tile.dart';

class AppSettingsSection extends StatelessWidget {
  const AppSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> appSettingsItems = [
      {'icon': Icons.color_lens, 'title': 'Appearance'},
      {'icon': Icons.language, 'title': 'language'},
      {'icon': Icons.notifications, 'title': 'Notifications'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Account Settings', style: Theme.of(context).textTheme.titleLarge),
        const Gap(AppSizes.spaceBtwItems),
        Container(
          width: DeviceUtils.getScreenWidth(),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(AppSizes.md),
          ),
          child: Column(
            children: List.generate(appSettingsItems.length, (index) {
              final item = appSettingsItems[index];
              return Column(
                children: [
                  SettingsMenuTile(icon: item['icon'], title: item['title']),
                  if (index !=
                      appSettingsItems.length -
                          1) //? Add divider except for the last item
                    Divider(
                      color: AppColors.darkerGrey.withValues(alpha: 0.2),
                      thickness: 1,
                      indent: 66,
                    ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
