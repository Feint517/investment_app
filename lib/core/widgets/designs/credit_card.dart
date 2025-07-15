import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/enums.dart';
import 'package:investment_app/core/widgets/images/responsive_svg_asset.dart';
import 'package:investment_app/features/payment/models/credit_card_model.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    super.key,
    required this.creditCard,
    this.isSelected = false,
  });

  final CreditCardModel creditCard;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: isSelected
              ? [Colors.blue.shade700, Colors.blue.shade400]
              : [Colors.grey.shade300, Colors.grey.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  creditCard.bankName,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                ResponsiveImageAsset(
                  assetPath: switch (creditCard.type) {
                    CreditCardType.visa => SvgAssets.visaLogo,
                    CreditCardType.mastercard => SvgAssets.mastercardLogo,
                  },
                  width: 40,
                ),
              ],
            ),
            Text(
              creditCard.cardNumber,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Holder',
                      style: TextStyle(
                        color: isSelected ? Colors.white70 : Colors.black45,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      creditCard.cardHolder,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expiry Date',
                      style: TextStyle(
                        color: isSelected ? Colors.white70 : Colors.black45,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      creditCard.expiryDate,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
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
