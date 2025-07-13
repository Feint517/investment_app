import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/styles/loaders.dart';
import 'package:investment_app/core/widgets/popups/fullscreen_loader.dart';
import 'package:investment_app/features/authentication/views/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //* variables
  final privacyPolicy = true.obs;
  final hidePassword = true.obs;
  final firstName = TextEditingController(text: 'arselene');
  final lastName = TextEditingController(text: 'doe');
  final userName = TextEditingController(text: 'arselene_doe');
  final email = TextEditingController(text: 'arselene@example.com');
  final phoneNumber = TextEditingController(text: '1234567890');
  final password = TextEditingController(text: '12345678tWX@');
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //* signup

  void signup() async {
    try {
      //* start loading
      CustomFullscreenLoader.openLoadingDialog(
        'We are processing your information...',
        LottieAssets.check,
      );

      //* check internet connection
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   CustomFullscreenLoader.stopLoading();
      //   return;
      // }

      //* form validation
      if (!signupFormKey.currentState!.validate()) {
        CustomFullscreenLoader.stopLoading();
        return;
      }

      //* privacy policy check
      if (!privacyPolicy.value) {
        CustomLoaders.showSnackBar(
          type: SnackBarType.warning,
          title: 'Accept privacy policy',
          message:
              'In order to create your account you have to accept our privacy policy',
        );
        CustomFullscreenLoader.stopLoading();
        return;
      }

      //* register user in the firebase authentication and save user data in firebase
      // final userCredential = await AuthenticationRepository.instance
      //     .registerWithEmailAndPassword(
      //       email.text.trim(),
      //       password.text.trim(),
      //     );

      //* save authenticated user data in firestore
      // final newUser = UserModel(
      //   id: userCredential.user!.uid,
      //   firstName: firstName.text.trim(),
      //   lastName: lastName.text.trim(),
      //   username: userName.text.trim(),
      //   email: email.text.trim(),
      //   password: password.text.trim(),
      //   phoneNumber: phoneNumber.text.trim(),
      //   profilePicture: '',
      // );

      //? we use Get.put() instead of instance because we didn't initiate the instance yet
      // final userRepository = Get.put(UserRepository());
      // await userRepository.saveUserRecord(newUser);

      Future.delayed(const Duration(seconds: 3));

      //* remove loader
      CustomFullscreenLoader.stopLoading();

      //* show success message
      CustomLoaders.showSnackBar(
        type: SnackBarType.success,
        title: 'Congratulations',
        message: 'Your account has been created, verify email to continue.',
      );

      //* move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
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
}
