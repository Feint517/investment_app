import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/features/payment/views/transactions.dart';
import 'package:investment_app/features/personalization/models/setting_tile_model.dart';
import 'package:investment_app/features/personalization/views/add_new_card.dart';
import 'package:investment_app/features/personalization/views/edit_account_info.dart';
import 'package:investment_app/features/personalization/views/manage_cards.dart';
import 'package:investment_app/features/personalization/widgets/setting_tile.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingTileModel> settingTiles = [
      SettingTileModel(
        icon: Iconsax.user,
        title: 'Account',
        subtitle: 'Profile and account settings',
        destination: () => const EditAccountInfoScreen(),
      ),
      SettingTileModel(
        icon: Iconsax.lock,
        title: 'Security',
        subtitle: 'Update your security settings',
      ),
      SettingTileModel(
        icon: Iconsax.devices,
        title: 'Devices',
        subtitle: 'Manage your devices',
      ),
      SettingTileModel(
        icon: Iconsax.card_edit,
        title: 'Payment Methods',
        subtitle: 'Manage your payment methods',
        // destination: () => const ManageCardsScreen(),
        destination: () => const AddNewCardScreen(),
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Account', style: Theme.of(context).textTheme.headlineSmall),
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
