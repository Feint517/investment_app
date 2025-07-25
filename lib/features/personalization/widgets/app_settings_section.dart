import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/features/personalization/models/setting_tile_model.dart';
import 'package:investment_app/features/personalization/widgets/setting_tile.dart';

class AppSettingsSection extends StatelessWidget {
  const AppSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingTileModel> settingTiles = [
      SettingTileModel(
        icon: Iconsax.notification,
        title: 'Notifications',
        subtitle: 'Manage your notifications',
      ),
      SettingTileModel(
        icon: Iconsax.language_circle,
        title: 'Language',
        subtitle: 'Change your app language',
      ),
      SettingTileModel(
        icon: Icons.palette,
        title: 'Themes',
        subtitle: 'Customize your app theme',
      ),
      SettingTileModel(
        icon: Iconsax.info_circle,
        title: 'About',
        subtitle: 'Learn more about the app',
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Application', style: Theme.of(context).textTheme.headlineSmall),
        const Gap(AppSizes.spaceBtwItems),
        ...List.generate(settingTiles.length, (index) {
          final tile = settingTiles[index];
          return Column(
            children: [
              SettingTile(settingTile: tile),
              if (index < settingTiles.length - 1)
                const Gap(AppSizes.spaceBtwItems),
            ],
          );
        }),
      ],
    );
  }
}
