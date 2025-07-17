// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:investment_app/core/constants/colors.dart';
// import 'package:investment_app/core/constants/text_strings.dart';
// import 'package:investment_app/features/authentication/controllers/signup_controller.dart';

// class TermsAndConditionsCheckBox extends GetView<SignupController> {
//   const TermsAndConditionsCheckBox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 24,
//           height: 24,
//           child: Obx(
//             () => Checkbox(
//               value: controller.privacyPolicy.value,
//               onChanged: (value) => controller.privacyPolicy.value =
//                   !controller.privacyPolicy.value,
//             ),
//           ),
//         ),
//         Text.rich(
//           TextSpan(
//             children: [
//               TextSpan(
//                 text: "${StringsManager.iAgreeTo} ",
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               TextSpan(
//                 text: StringsManager.privacy,
//                 style: Theme.of(context).textTheme.bodyMedium!.apply(
//                   color: AppColors.primary,
//                   decoration: TextDecoration.underline,
//                   decorationColor: AppColors.primary,
//                 ),
//               ),
//               TextSpan(
//                 text: " ${StringsManager.and}  ",
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               TextSpan(
//                 text: StringsManager.terms,
//                 style: Theme.of(context).textTheme.bodyMedium!.apply(
//                   color: AppColors.primary,
//                   decoration: TextDecoration.underline,
//                   decorationColor: AppColors.primary,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
