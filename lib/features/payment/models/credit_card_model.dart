import 'package:investment_app/core/constants/enums.dart';

class CreditCardModel {
  CreditCardModel({
    required this.type,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.bankName,
  });

  final CreditCardType type;
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final String bankName;
}
