import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/buttons/custom_button.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/payment/controllers/payment_controller.dart';
import 'package:investment_app/features/payment/widgets/enter_payment_details_section.dart';
import 'package:investment_app/features/payment/widgets/pay_process_timeline.dart';

class CheckoutScreen extends GetView<PaymentController> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return GradientScaffold(
      appBar: CustomAppBar(title: 'Checkout', showBackButton: true),
      body: SafeArea(
        right: false,
        left: false,
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Column(
            children: [
              const PayProcessTimeline(),
              const Gap(AppSizes.spaceBtwSections),

              Expanded(
                child: Obx(
                  () => switch (controller.currentStep.value) {
                    PaymentSteps.reviseDetails => const ReviseDetailsSection(),
                    PaymentSteps.enterPaymentDetails =>
                      const EnterPaymentDetailsSection(),
                    PaymentSteps.finish => const FinishSection(),
                  },
                ),
              ),
              const Gap(AppSizes.spaceBtwSections),

              //* Navigation Buttons
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.currentStep.value !=
                        PaymentSteps.reviseDetails)
                      CustomButton(
                        label: 'Back',
                        width: DeviceUtils.getScreenWidth() * 0.4,
                        onPressed: controller.goToPreviousStep,
                      ),
                    const Spacer(),
                    CustomButton(
                      isGradientBackground: true,
                      label: controller.currentStep.value == PaymentSteps.finish
                          ? 'Finish'
                          : 'Next',
                      width: DeviceUtils.getScreenWidth() * 0.4,
                      onPressed: () {
                        if (controller.currentStep.value ==
                            PaymentSteps.finish) {
                          Get.snackbar('Success', 'Checkout completed!');
                        } else {
                          controller.goToNextStep();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviseDetailsSection extends StatelessWidget {
  const ReviseDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class FinishSection extends StatelessWidget {
  const FinishSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
