import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:investment_app/data/repositories/authentication_repository.dart';
import 'package:investment_app/features/investment/views/home.dart';

import '../../../core/constants/assets_manager.dart';
import '../../../core/network/network_manager.dart';
import '../../../core/styles/loaders.dart';
import '../../../core/widgets/popups/fullscreen_loader.dart';

class LoginController extends GetxController {
  //* variables
  final localStorage = GetStorage();
  final email = TextEditingController(text: 'arselene.dev@gmail.com');
  final password = TextEditingController(text: '12345678gsT@');
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // final userController = Get.put(UserController());

  //* email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      //* start loading
      CustomFullscreenLoader.openLoadingDialog(
        'Logging in...',
        LottieAssets.check,
      );

      //* check internet connection
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   CustomFullscreenLoader.stopLoading();
      //   return;
      // }

      //* form validation
      if (!loginFormKey.currentState!.validate()) {
        CustomFullscreenLoader.stopLoading();
        return;
      }

      //* save data if remember me is selected
      // if (rememberMe.value) {
      //   localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      //   localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      // }
      // if (kDebugMode) {
      //   print(localStorage.read('REMEMBER_ME_EMAIL'));
      //   print(localStorage.read('REMEMBER_ME_PASSWORD'));
      // }

      //* login user using email and password authentication
      // await AuthenticationRepository.instance
      //     .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      Future.delayed(const Duration(seconds: 2));

      //* remove loader
      CustomFullscreenLoader.stopLoading();

      //* redirect
      // AuthenticationRepository.instance.screenRedirect();
      Get.off(() => const HomeScreen());
    } catch (e) {
      //* remove the loader
      CustomFullscreenLoader.stopLoading();

      //* show some generic error to the user
      CustomLoaders.showSnackBar(
        type: SnackBarType.error,
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }

  //* Google sign in
  Future<void> googleSignIn() async {
    try {
      //* start loading
      CustomFullscreenLoader.openLoadingDialog(
        'Logging in...',
        LottieAssets.check,
      );

      //* check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullscreenLoader.stopLoading();
        return;
      }

      //* Google authentication
      final userCredentials = await AuthenticationRepository.instance
          .signInWithGoogle();

      //* save user record
      // await userController.saveUserRecord(userCredentials);

      //* remove loader
      CustomFullscreenLoader.stopLoading();

      //* redirect
      AuthenticationRepository.instance.screenRedirect();
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
