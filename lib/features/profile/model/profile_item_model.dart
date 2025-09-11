import 'package:flutter/services.dart';

class ProfileItemModel {
  final String label;
  final String icon;
  final bool isDeleteAccount;
  final VoidCallback onTap;

  ProfileItemModel({
    required this.label,
    required this.icon,
    this.isDeleteAccount = false,
    required this.onTap,
  });
}