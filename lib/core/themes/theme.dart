import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/themes/custom_themes/text_field_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/text_theme.dart';

class CustomAppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
    //appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    //bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    //elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    //outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    //inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
    textTheme: CustomTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
    //appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    //bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    //elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    //outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    //inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
    textTheme: CustomTextTheme.darkTextTheme,
  );
}
