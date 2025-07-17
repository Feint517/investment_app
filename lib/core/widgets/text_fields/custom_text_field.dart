import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/utils/device_utils.dart';
import 'package:investment_app/core/utils/validation_utils.dart';

enum TextFieldType { email, password, phoneNumber, text }

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.fillColor,
    this.cursorColor = AppColors.primary,
    this.showBorder = true,
    this.borderColor = AppColors.darkGrey,
    this.hintText,
    this.type = TextFieldType.text,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.borderRadius = 40,
  });

  final TextEditingController controller;
  final Color? fillColor;
  final Color cursorColor;
  final bool showBorder;
  final Color borderColor;
  final String? hintText;
  final TextFieldType type;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    var obscureText = false.obs;
    TextInputType keyboardType;
    String defaultHint;
    switch (type) {
      case TextFieldType.email:
        keyboardType = TextInputType.emailAddress;
        defaultHint = 'Email';
        break;
      case TextFieldType.password:
        keyboardType = TextInputType.text;
        defaultHint = 'Password';
        break;
      case TextFieldType.text:
        keyboardType = TextInputType.text;
        defaultHint = 'Enter text';
        break;
      case TextFieldType.phoneNumber:
        keyboardType = TextInputType.phone;
        defaultHint = 'Enter phone number';
        break;
    }
    return Container(
      width: DeviceUtils.getScreenWidth(),
      height: 50,
      decoration: BoxDecoration(
        color: fillColor ?? AppColors.light,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor.withValues(alpha: 0.5),
          width: 1.0,
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText.value,
        keyboardType: keyboardType,
        cursorColor: cursorColor,
        validator: switch (type) {
          TextFieldType.email => (value) => ValidationUtils.validateEmail(
            value,
          ),
          TextFieldType.password => (value) => ValidationUtils.validatePassword(
            value,
          ),
          TextFieldType.text => (value) => ValidationUtils.validateEmptyText(
            'Text',
            value,
          ),
          TextFieldType.phoneNumber =>
            (value) => ValidationUtils.validatePhoneNumber(value),
        },
        decoration: InputDecoration(
          prefixIcon: switch (type) {
            TextFieldType.email => Icon(
              Icons.mail_outline,
              color: prefixIconColor ?? AppColors.darkGrey,
            ),
            TextFieldType.password => Icon(
              Iconsax.lock,
              color: prefixIconColor ?? AppColors.darkGrey,
            ),
            TextFieldType.text =>
              (prefixIcon != null)
                  ? Icon(
                      prefixIcon,
                      color: prefixIconColor ?? AppColors.darkGrey,
                    )
                  : null,
            TextFieldType.phoneNumber => Icon(
              Iconsax.call,
              color: prefixIconColor ?? AppColors.darkGrey,
            ),
          },
          suffixIcon: switch (type) {
            TextFieldType.email =>
              (suffixIcon != null)
                  ? Icon(
                      suffixIcon,
                      color: suffixIconColor ?? AppColors.primary,
                    )
                  : null,
            TextFieldType.password => Obx(
              () => IconButton(
                icon: Icon(
                  obscureText.value ? Iconsax.eye_slash : Iconsax.eye,
                  color: suffixIconColor ?? AppColors.primary,
                  size: 20,
                ),
                onPressed: () => obscureText.value = !obscureText.value,
              ),
            ),
            TextFieldType.text =>
              (suffixIcon != null)
                  ? Icon(
                      suffixIcon,
                      color: suffixIconColor ?? AppColors.primary,
                    )
                  : null,
            TextFieldType.phoneNumber => null,
          },
          hintText: hintText ?? defaultHint,
          hintStyle: TextStyle(color: AppColors.darkGrey),
          filled: true,
          fillColor: DeviceUtils.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: showBorder
                ? BorderSide(color: borderColor, width: 1)
                : BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: showBorder
                ? BorderSide(color: borderColor, width: 1)
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: showBorder
                ? BorderSide(color: borderColor, width: 2)
                : BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: showBorder
                ? BorderSide(color: Colors.red, width: 2)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
