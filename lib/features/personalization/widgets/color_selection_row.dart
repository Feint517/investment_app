import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app/features/personalization/controllers/add_new_card_controller.dart';

class ColorSelectionRow extends GetView<AddNewCardController> {
  const ColorSelectionRow({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var color in [
          Colors.blue,
          Colors.red,
          Colors.green,
          Colors.orange,
          Colors.purple,
          Colors.yellow,
        ])
          GestureDetector(
            onTap: () => controller.changeCardColor(color),
            child: Obx(
              () => Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: controller.selectedColor.value == color
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

