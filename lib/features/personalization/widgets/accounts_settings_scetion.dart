import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/features/personalization/widgets/settings_menu_tile.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accoutSettingsItems = [
      {'icon': Icons.person, 'title': 'Account'},
      {'icon': Icons.lock, 'title': 'Data & Privacy'},
      {'icon': Icons.notifications, 'title': 'Devices & Sessions'},
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
            children: List.generate(accoutSettingsItems.length, (index) {
              final item = accoutSettingsItems[index];
              return Column(
                children: [
                  SettingsMenuTile(icon: item['icon'], title: item['title']),
                  if (index !=
                      accoutSettingsItems.length -
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
