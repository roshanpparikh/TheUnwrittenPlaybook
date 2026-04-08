import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  /// Returns true if the current theme is dark
  bool get isDarkMode => MediaQuery.of(this).platformBrightness == Brightness.dark;
}