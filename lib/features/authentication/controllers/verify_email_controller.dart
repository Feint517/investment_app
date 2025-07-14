import 'package:get/get.dart';
import 'package:investment_app/core/constants/assets_manager.dart';
import 'package:investment_app/core/constants/text_strings.dart';
import 'package:investment_app/core/styles/loaders.dart';
import 'package:investment_app/core/widgets/success_screen/success_screen.dart';
import 'package:investment_app/features/investment/views/home.dart';
import 'package:investment_app/navigation_menu.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //* send email whenever verify screen appear and set timer for auto redirect
  // @override
  // void onInit() {
  //   sendEmailVerification();
  //   setTimerForAutoRedirect();
  //   super.onInit();
  // }

  Future<void> checkEmailVerificationStatus() async {
    try {
      //await AuthenticationRepository.instance.sendEmailVerification();

      Future.delayed(const Duration(seconds: 2));

      CustomLoaders.showSnackBar(
        type: SnackBarType.success,
        title: 'Email sent',
        message: 'Please check your inbox and verify your email',
      );

      Get.off(
        () => SuccessScreen(
          title: StringsManager.yourAccountCreatedTitle,
          subtitle: StringsManager.yourAccountCreatedSubtitle,
          image: LottieAssets.success,
          // onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ),
      );
    } catch (e) {
      CustomLoaders.showSnackBar(
        type: SnackBarType.error,
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }

  //* send email verification link
  sendEmailVerification() async {
    try {
      //await AuthenticationRepository.instance.sendEmailVerification();

      Future.delayed(const Duration(seconds: 2));

      CustomLoaders.showSnackBar(
        type: SnackBarType.success,
        title: 'Email sent',
        message: 'Please check your inbox and verify your email',
      );

      Get.off(
        () => SuccessScreen(
          title: StringsManager.yourAccountCreatedTitle,
          subtitle: StringsManager.yourAccountCreatedSubtitle,
          image: LottieAssets.success,
          // onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ),
      );
    } catch (e) {
      CustomLoaders.showSnackBar(
        type: SnackBarType.error,
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }

  //* timer to automatically redirect on email verification
  // setTimerForAutoRedirect() {
  //   //? after each second, execute the following function
  //   Timer.periodic(
  //     const Duration(seconds: 1),
  //     (timer) async {
  //       await FirebaseAuth.instance.currentUser?.reload();
  //       final user = FirebaseAuth.instance.currentUser;
  //       if (user?.emailVerified ?? false) {
  //         timer.cancel();
  //         Get.off(
  //           () => SuccessScreen(
  //             title: TTexts.yourAccountCreatedTitle,
  //             subtitle: TTexts.yourAccountCreatedSubtitle,
  //             image: TAnimations.success,
  //             onPressed: () =>
  //                 AuthenticationRepository.instance.screenRedirect(),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  //* check if email is verified
  // checkEmailVerificationStatus() async {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   if (currentUser != null && currentUser.emailVerified) {
  //     Get.off(
  //       () => SuccessScreen(
  //         title: TTexts.yourAccountCreatedTitle,
  //         subtitle: TTexts.yourAccountCreatedSubtitle,
  //         image: TAnimations.success,
  //         onPressed: () => AuthenticationRepository.instance.screenRedirect(),
  //       ),
  //     );
  //   }
  // }
}
