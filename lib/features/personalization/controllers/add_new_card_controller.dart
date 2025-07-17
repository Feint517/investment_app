import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCardController extends GetxController{
  var cardNumber = ''.obs;
  var cardHolderName = ''.obs;
  var expiryDate = ''.obs;
  var cvv = ''.obs;
  
  // Rx<Color> selectedColor = Colors.blue.obs;
  Rx<LinearGradient> selectedGradient = const LinearGradient(
    colors: [Colors.blue, Color(0xFF1976D2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).obs;
  final cardNumberController = TextEditingController();
  final cardHolderNameController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();
  GlobalKey<FormState> addNewCardFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    //? Listen to changes in the TextEditingControllers and update observables
    cardNumberController.addListener(() {
      cardNumber.value = cardNumberController.text;
    });
    cardHolderNameController.addListener(() {
      cardHolderName.value = cardHolderNameController.text;
    });
    expiryDateController.addListener(() {
      expiryDate.value = expiryDateController.text;
    });
    cvvController.addListener(() {
      cvv.value = cvvController.text;
    });
  }

  // void changeCardColor(Color color) {
  //   selectedColor.value = color; // Update the selected color
  // }
  void changeCardGradient(LinearGradient gradient) {
    selectedGradient.value = gradient;
  }
}