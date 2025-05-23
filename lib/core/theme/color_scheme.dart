import 'package:flutter/material.dart';

/// Common interface for color palettes
abstract class AppColorsPalette {
  Color get primaryColor;
  Color get surfaceBorder;
  Color get textPrimaryHeader;
  Color get textPrimaryBody;
  Color get textAccent;
  Color get errorColor;
  // Color get alwaysBlack; // <--- REMOVE THIS LINE
  // Add others as needed...
}

/// Global access point for theme colors
class AppColors {
  static const light = LightColors();
  static const dark = DarkColors();

  /// A color that is always black, regardless of the theme.
  static const Color alwaysBlack = Color(0xFF000000);
}

/// Light theme colors
class LightColors implements AppColorsPalette {
  const LightColors();

  // Brand
  @override
  final Color primaryColor = const Color(0xFFD69712);

  // Background & Surface
  final Color background = const Color(0xFFF4F5F6);
  final Color surfaceBackground = const Color.fromRGBO(255, 255, 255, 0.8);
  @override
  final Color surfaceBorder = const Color(0xFFFFFFFF);
  final Color surfaceButtonBackground = const Color.fromRGBO(19, 21, 23, 0.04);
  final Color surfaceButtonText = const Color.fromRGBO(19, 21, 23, 0.64);

  // Text
  @override
  final Color textPrimaryHeader = const Color(0xFF131517);
  @override
  final Color textPrimaryBody = const Color(0xFF131517);
  final Color textSecondary = const Color(0xFF6B7280);
  @override
  final Color textAccent = const Color(0xFFD69712);

  // Error
  @override
  final Color errorColor = const Color(0xFFB00020);
}

/// Dark theme colors
class DarkColors implements AppColorsPalette {
  const DarkColors();

  // Brand
  @override
  final Color primaryColor = const Color(0xFFF2CA77);

  // Background & Surface
  final Color background = const Color(0xFF131517);
  final Color surfaceBackground = const Color.fromRGBO(255, 255, 255, 0.04);
  @override
  final Color surfaceBorder = const Color.fromRGBO(255, 255, 255, 0.04);
  final Color surfaceButtonBackground = const Color.fromRGBO(255, 255, 255, 0.08);
  final Color surfaceButtonText = const Color.fromRGBO(255, 255, 255, 0.64);

  // Text
  @override
  final Color textPrimaryHeader = const Color(0xFFFFFFFF);
  @override
  final Color textPrimaryBody = const Color(0xFFF4F5F6);
  final Color textSecondary = const Color(0xFF9CA3AF);
  @override
  final Color textAccent = const Color(0xFFF2CA77);

  // Error
  @override
  final Color errorColor = const Color(0xFFCF6679);
}