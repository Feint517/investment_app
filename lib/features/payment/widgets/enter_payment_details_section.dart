import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/enums.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/features/payment/controllers/payment_controller.dart';
import 'package:investment_app/features/payment/widgets/credit_cards_section.dart';
import 'package:investment_app/features/payment/widgets/payment_method_selection_tile.dart';

class EnterPaymentDetailsSection extends GetView<PaymentController> {
  const EnterPaymentDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentMethodSelectionTile(paymentMethod: PaymentMethod.creditCard),
        const Gap(AppSizes.spaceBtwItems),
        Obx(
          () =>
              (controller.selectedPaymentMethod.value ==
                  PaymentMethod.creditCard)
              ? Column(
                  children: [
                    const CreditCardsSection(),
                    const Gap(AppSizes.spaceBtwItems),
                  ],
                )
              : SizedBox.shrink(),
        ),

        // const Gap(AppSizes.spaceBtwItems),
        PaymentMethodSelectionTile(paymentMethod: PaymentMethod.paypal),
        const Gap(AppSizes.spaceBtwItems),
        PaymentMethodSelectionTile(paymentMethod: PaymentMethod.applePay),
        // const Spacer(),
        // CustomButton(
        //   isGradientBackground: true,
        //   label: 'Confirm Payment',
        //   width: DeviceUtils.getScreenWidth() * 0.69,
        //   onPressed: () {
        //     Get.snackbar('Payment', 'Payment successful!');
        //   },
        // ),
      ],
    );
  }
}