import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/images/responsive_svg_asset.dart';
import 'package:investment_app/features/personalization/controllers/add_new_card_controller.dart';

class CreditCardRepresentation extends GetView<AddNewCardController> {
  const CreditCardRepresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(AppSizes.md),
        width: DeviceUtils.getScreenWidth(),
        height: 220,
        decoration: BoxDecoration(
          color: controller.selectedColor.value,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                const ResponsiveImageAsset(
                  assetPath: SvgAssets.mastercardLogo,
                  width: 40,
                ),
              ],
            ),
            const Gap(AppSizes.md),
            Text(
              controller.cardNumber.value.isEmpty
                  ? 'XXXX - XXXX - XXXX - XXXX'
                  : controller.cardNumber.value,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Card Holder Name',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
                    ),
                    const Gap(AppSizes.xs),
                    SizedBox(
                      width: 160,
                      child: Text(
                        controller.cardHolderName.value.isEmpty
                            ? 'John Doe'
                            : controller.cardHolderName.value,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Expiry Date',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
                    ),
                    const Gap(AppSizes.xs),
                    Text(
                      controller.expiryDate.value.isEmpty
                          ? 'MM/YY'
                          : controller.expiryDate.value,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CVV',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
                    ),
                    const Gap(AppSizes.xs),
                    Text(
                      controller.cvv.value.isEmpty
                          ? 'XXX'
                          : controller.cvv.value,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
