import 'package:flutter/material.dart';

class SavedCardModel {
  SavedCardModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
    required this.cardColor,
  });

  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvv;
  final Color cardColor;
}
