import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/sizes.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';

class EditAccountInfoScreen extends StatelessWidget {
  const EditAccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: CustomAppBar(title: 'Edit Account Info', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your form fields and widgets here
            // For example, TextFormField for editing account info
            // ...
          ],
        ),
      ),
    );
  }
}
