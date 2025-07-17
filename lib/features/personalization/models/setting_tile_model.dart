import 'package:flutter/material.dart';

class SettingTileModel {
  SettingTileModel({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.destination,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget Function()? destination;
}
