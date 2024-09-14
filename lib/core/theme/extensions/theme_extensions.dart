import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}