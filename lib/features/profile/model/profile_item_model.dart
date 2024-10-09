import 'package:flutter/services.dart';

class ProfileItemModel {
  final String label;
  final String icon;
  final VoidCallback onTap;

  ProfileItemModel({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}