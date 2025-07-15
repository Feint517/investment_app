import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/styles/loaders.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/buttons/custom_button.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';
import 'package:investment_app/features/personalization/controllers/add_new_card_controller.dart';
import 'package:investment_app/features/personalization/widgets/card_details_form.dart';
import 'package:investment_app/features/personalization/widgets/color_selection_row.dart';
import 'package:investment_app/features/personalization/widgets/credit_card_representation.dart';

class AddNewCardScreen extends GetView<AddNewCardController> {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewCardController());
    return GradientScaffold(
      appBar: CustomAppBar(title: 'Add New Card', showBackArrow: true),
      body: SafeArea(
        top: false,
        right: false,
        left: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(AppSizes.xl),
              const CreditCardRepresentation(),
              const Gap(AppSizes.spaceBtwItems),

              const ColorSelectionRow(),
              const Gap(AppSizes.spaceBtwSections),

              const CardDetailsForm(),
              const Spacer(),

              CustomButton(
                isGradientBackground: true,
                label: 'Add Card',
                onPressed: () {
                  if (controller.addNewCardFormKey.currentState?.validate() ??
                      false) {
                    CustomLoaders.showSnackBar(
                      type: SnackBarType.success,
                      title: 'Card added successfully',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
