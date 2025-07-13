import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/network/network_manager.dart';
import 'package:investment_app/core/styles/loaders.dart';
import 'package:investment_app/core/widgets/popups/fullscreen_loader.dart';
import 'package:investment_app/data/repositories/authentication_repository.dart';
import 'package:investment_app/features/authentication/views/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //* variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //* send reset password email
  void sendPasswordResetEmail() async {
    try {
      //* start loading
      CustomFullscreenLoader.openLoadingDialog(
        'Processing your request...',
        LottieAssets.check,
      );

      //* check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullscreenLoader.stopLoading();
        return;
      }

      //* form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        CustomFullscreenLoader.stopLoading();
        return;
      }

      //* send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      //* remove loader
      CustomFullscreenLoader.stopLoading();

      //* show success screen
      CustomLoaders.showSnackBar(
        type: SnackBarType.success,
        title: 'Email sent',
        message: 'Email link sent to reset your password'.tr,
      );

      //* redirec
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      //* remove loader
      CustomFullscreenLoader.stopLoading();
      CustomLoaders.showSnackBar(
        type: SnackBarType.error,
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }

  void resendPasswordResetEmail(String email) async {
    try {
      //* start loading
      CustomFullscreenLoader.openLoadingDialog(
        'Processing your request...',
        LottieAssets.check,
      );

      //* check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullscreenLoader.stopLoading();
        return;
      }

      //* send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //* remove loader
      CustomFullscreenLoader.stopLoading();

      //* show success screen
      CustomLoaders.showSnackBar(
        type: SnackBarType.success,
        title: 'Email sent',
        message: 'Email link sent to reset your password'.tr,
      );
    } catch (e) {
      //* remove loader
      CustomFullscreenLoader.stopLoading();
      CustomLoaders.showSnackBar(
        type: SnackBarType.error,
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }
}
