import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/colors.dart';

class CustomTextFormFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.primary,
    suffixIconColor: AppColors.primary,
    //*constraints
    labelStyle: const TextStyle(fontSize: 14, color: AppColors.primary),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColors.primary,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.black.withValues(alpha: 0.8),
    ),
    filled: true,
    fillColor: AppColors.light,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: AppColors.darkGrey.withValues(alpha: 0.5),
        width: 1.5, // Border width
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: AppColors.darkGrey.withValues(alpha: 0.5),
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.primary,
    suffixIconColor: AppColors.white,
    //*constraints
    labelStyle: const TextStyle(fontSize: 14, color: AppColors.primary),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColors.primary,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.white.withValues(alpha: 0.8),
    ),
    filled: true,
    fillColor: AppColors.darkerGrey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: AppColors.darkGrey.withValues(alpha: 0.5),
        width: 1.5, // Border width
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: AppColors.darkGrey.withValues(alpha: 0.5),
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );
}
