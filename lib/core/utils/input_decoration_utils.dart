import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/colors.dart';

InputDecoration buildInputDecoration({required String labelText}) {
  return InputDecoration(
    // labelText: labelText,
    // labelStyle: TextStyle(color: AppColors.darkerGrey),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.grey, // Grey bottom border
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.darkGrey, // Primary color when focused
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.warning, // Red border for validation errors
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.warning, // Red border when focused with error
      ),
    ),
  );
}
