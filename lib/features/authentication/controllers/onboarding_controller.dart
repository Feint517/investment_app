import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:investment_app/features/authentication/views/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //* variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      if (kDebugMode) {
        print("================ Get Storage NEXT BUTTON ================");
        print(storage.read('isFirstTime'));
      }

      storage.write('isFirstTime', false);

      if (kDebugMode) {
        print("================ Get Storage NEXT BUTTON ================");
        print(storage.read('isFirstTime'));
      }

      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2; //! values start from 0, 1, 2....
    pageController.jumpToPage(2);
  }
}
