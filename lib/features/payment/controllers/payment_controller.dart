import 'package:get/get.dart';
import 'package:investment_app/core/constants/enums.dart';

enum PaymentSteps {
  reviseDetails,
  enterPaymentDetails,
  finish,
}

class PaymentController extends GetxController {
  var selectedPaymentMethod = PaymentMethod.creditCard.obs;
  var currentStep = PaymentSteps.reviseDetails.obs;

  void selectPaymentMethod(PaymentMethod value) {
    selectedPaymentMethod.value = value;
  }

  void goToNextStep() {
    if (currentStep.value == PaymentSteps.reviseDetails) {
      currentStep.value = PaymentSteps.enterPaymentDetails;
    } else if (currentStep.value == PaymentSteps.enterPaymentDetails) {
      currentStep.value = PaymentSteps.finish;
    }
  }

  void goToPreviousStep() {
    if (currentStep.value == PaymentSteps.finish) {
      currentStep.value = PaymentSteps.enterPaymentDetails;
    } else if (currentStep.value == PaymentSteps.enterPaymentDetails) {
      currentStep.value = PaymentSteps.reviseDetails;
    }
  }
}