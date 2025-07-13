import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextTheme {
  static const Color _lightTextColor = Colors.black;
  static const Color _darkTextColor = Colors.white;

  static TextStyle _baseTextStyle(Color color) =>
      TextStyle(fontFamily: 'Montserrat', color: color);

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 32.sp, fontWeight: FontWeight.bold),
    headlineMedium: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 24.sp, fontWeight: FontWeight.w600),
    headlineSmall: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
    titleLarge: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
    titleMedium: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
    titleSmall: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
    bodyLarge: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
    bodyMedium: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal),
    bodySmall: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
    labelLarge: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal),
    labelMedium: _baseTextStyle(
      _lightTextColor,
    ).copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 32.sp, fontWeight: FontWeight.bold),
    headlineMedium: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 24.sp, fontWeight: FontWeight.w600),
    headlineSmall: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
    titleLarge: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
    titleMedium: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
    titleSmall: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
    bodyLarge: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
    bodyMedium: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal),
    bodySmall: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
    labelLarge: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal),
    labelMedium: _baseTextStyle(
      _darkTextColor,
    ).copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal),
  );
}
