import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/enums.dart';
import 'package:investment_app/core/widgets/designs/credit_card.dart';
import 'package:investment_app/features/payment/models/credit_card_model.dart';

class CreditCardsSection extends StatelessWidget {
  const CreditCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CreditCardModel> creditCards = [
      CreditCardModel(
        type: CreditCardType.visa,
        cardNumber: '**** **** **** 1234',
        cardHolder: 'John Doe',
        expiryDate: '12/25',
        bankName: 'Bank of Congo',
      ),
      CreditCardModel(
        type: CreditCardType.mastercard,
        cardNumber: '**** **** **** 5678',
        cardHolder: 'Jane Smith',
        expiryDate: '11/24',
        bankName: 'Congo National Bank',
      ),
      CreditCardModel(
        type: CreditCardType.visa,
        cardNumber: '**** **** **** 9012',
        cardHolder: 'Alice Johnson',
        expiryDate: '10/23',
        bankName: 'Congo Trust Bank',
      ),
    ];
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        itemCount: creditCards.length,
        itemBuilder: (context, index) {
          final card = creditCards[index];
          return CreditCard(
            creditCard: card,
            isSelected: index == 0, //? Highlight the first card by default
          );
        },
      ),
    );
  }
}