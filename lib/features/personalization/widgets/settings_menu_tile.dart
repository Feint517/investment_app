import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      leading: Icon(icon, size: 24, color: AppColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: AppColors.primary,
      ),
      onTap: onTap,
    );
  }
}
