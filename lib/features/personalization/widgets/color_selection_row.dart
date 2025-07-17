import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/features/personalization/controllers/add_new_card_controller.dart';

class ColorSelectionRow extends GetView<AddNewCardController> {
  const ColorSelectionRow({super.key});

  static const List<LinearGradient> gradientOptions = [
    LinearGradient(
      colors: [Colors.blue, Color(0xFF1976D2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Colors.red, Color(0xFFD32F2F)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Colors.green, Color(0xFF388E3C)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Colors.orange, Color(0xFFF57C00)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Colors.purple, Color(0xFF7B1FA2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Colors.amber, Color(0xFFFFA000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var gradient in gradientOptions)
          GestureDetector(
            onTap: () => controller.changeCardGradient(gradient),
            child: Obx(
              () => Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: gradient,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        controller.selectedGradient.value.colors.first ==
                            gradient.colors.first
                        ? Colors.black
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
