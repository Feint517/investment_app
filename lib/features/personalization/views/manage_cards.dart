import 'package:flutter/material.dart';
import 'package:investment_app/core/widgets/appbar/appbar.dart';
import 'package:investment_app/core/widgets/misc/gradient_scaffold.dart';

class ManageCardsScreen extends StatelessWidget {
  const ManageCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: CustomAppBar(title: 'Manage Cards', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Manage your cards here.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
