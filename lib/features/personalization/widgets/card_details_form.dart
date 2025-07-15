import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/helpers/card_number_input_formatter.dart';
import 'package:investment_app/core/utils/input_decoration_utils.dart';
import 'package:investment_app/core/utils/validation_utils.dart';
import 'package:investment_app/features/personalization/controllers/add_new_card_controller.dart';

class CardDetailsForm extends GetView<AddNewCardController> {
  const CardDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.addNewCardFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Number',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.primary),
          ),
          const Gap(AppSizes.xs),
          TextFormField(
            controller: controller.cardNumberController,
            decoration: buildInputDecoration(labelText: 'Card Number'),
            style: Theme.of(context).textTheme.bodyMedium,
            validator: (value) => ValidationUtils.validateCardNumber(value),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CardNumberInputFormatter(),
              LengthLimitingTextInputFormatter(19),
            ],
            keyboardType: TextInputType.number,
          ),
          const Gap(AppSizes.spaceBtwInputFields),
          Text(
            'Card Holder Name',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.primary),
          ),
          const Gap(AppSizes.xs),
          TextFormField(
            controller: controller.cardHolderNameController,
            decoration: buildInputDecoration(labelText: 'Card Holder Name'),
            style: Theme.of(context).textTheme.bodyMedium,
            validator: (value) =>
                ValidationUtils.validateEmptyText('Card Holder Name', value),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z\s]'),
              ), //? Allow only letters and spaces
            ],
            keyboardType: TextInputType.name,
          ),
          const Gap(AppSizes.spaceBtwInputFields),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expires on',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: AppColors.primary),
                    ),
                    const Gap(AppSizes.xs),
                    TextFormField(
                      controller: controller.expiryDateController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now(), //? Prevent selecting past dates
                          lastDate: DateTime(
                            DateTime.now().year + 10,
                          ), //? Allow up to 10 years in the future
                        );

                        if (pickedDate != null) {
                          //? Format the selected date as MM/YY
                          String formattedDate =
                              '${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year.toString().substring(2)}';
                          controller.expiryDateController.text = formattedDate;
                        }
                      },
                      decoration: buildInputDecoration(labelText: 'MM/YY'),
                      style: Theme.of(context).textTheme.bodyMedium,
                      validator: (value) => ValidationUtils.validateEmptyText(
                        'Expiry Date',
                        value,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3-Digit CVV',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: AppColors.primary),
                    ),
                    const Gap(AppSizes.xs),
                    TextFormField(
                      controller: controller.cvvController,
                      decoration: buildInputDecoration(
                        labelText: '3-Digit CVV',
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      validator: (value) => ValidationUtils.validateEmptyText(
                        '3-Digit CVV',
                        value,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(
                          3,
                        ), //? Limit input to 3 digits
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
