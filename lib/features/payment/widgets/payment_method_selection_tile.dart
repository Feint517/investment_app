import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/enums.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/images/responsive_svg_asset.dart';
import 'package:investment_app/features/payment/controllers/payment_controller.dart';

class PaymentMethodSelectionTile extends GetView<PaymentController> {
  const PaymentMethodSelectionTile({super.key, required this.paymentMethod});

  final PaymentMethod paymentMethod;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.selectPaymentMethod(paymentMethod),
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: DeviceUtils.getScreenWidth(),
          height: 80,
          decoration: BoxDecoration(
            color: controller.selectedPaymentMethod.value == paymentMethod
                ? AppColors.primary.withValues(alpha: 0.8)
                : AppColors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Obx(
                  () => Radio<PaymentMethod>(
                    value: paymentMethod,
                    groupValue: controller.selectedPaymentMethod.value,
                    onChanged: (PaymentMethod? value) {
                      if (value != null) {
                        controller.selectPaymentMethod(value);
                      }
                    },
                    activeColor: AppColors.primary,
                  ),
                ),
              ),
              Text(
                switch (paymentMethod) {
                  PaymentMethod.creditCard => 'Credit Card',
                  PaymentMethod.paypal => 'PayPal',
                  PaymentMethod.applePay => 'Apple Pay',
                },
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              ResponsiveImageAsset(
                assetPath: switch (paymentMethod) {
                  PaymentMethod.creditCard => SvgAssets.bankAccountLogo,
                  PaymentMethod.paypal => SvgAssets.paypalLogo,
                  PaymentMethod.applePay => SvgAssets.appleLogo,
                },
                width: 20,
                height: 40,
              ),
              const Gap(AppSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}