import 'package:flutter/material.dart';

/// A comprehensive color system for the app.
/// 
/// Usage with ThemeData:
/// ```dart
/// ThemeData(
///   primaryColor: AppColors.light.primaryColor,
///   scaffoldBackgroundColor: AppColors.light.background,
///   colorScheme: ColorScheme.light(
///     primary: AppColors.light.primaryColor,
///     background: AppColors.light.background,
///     surface: AppColors.light.surfaceBackground,
///     error: AppColors.light.errorColor,
///   ),
/// )
/// ```
class AppColors {
  /// Light theme colors
  static const _LightColors light = _LightColors();
  
  /// Dark theme colors
  static const _DarkColors dark = _DarkColors();
}

/// Light theme color definitions
class _LightColors {
  const _LightColors();

  // Brand Colors
  /// Primary brand color
  final Color primaryColor = const Color(0xFFD69712); // rgb(214, 151, 18)

  // Background Colors
  /// Main background color
  final Color background = const Color(0xFFF4F5F6);
  
  // Surface Colors
  /// Surface background color with 80% opacity
  final Color surfaceBackground = const Color.fromRGBO(255, 255, 255, 0.8);
  /// Surface border color
  final Color surfaceBorder = const Color(0xFFFFFFFF);
  /// Surface button background color with 4% opacity
  final Color surfaceButtonBackground = const Color.fromRGBO(19, 21, 23, 0.04);
  /// Surface button text color with 64% opacity
  final Color surfaceButtonText = const Color.fromRGBO(19, 21, 23, 0.64);

  // Text Colors
  /// Primary header text color
  final Color textPrimaryHeader = const Color(0xFF131517);
  /// Primary body text color
  final Color textPrimaryBody = const Color(0xFF131517);
  /// Secondary text color
  final Color textSecondary = const Color(0xFF6B7280);
  /// Accent text color
  final Color textAccent = const Color(0xFFD69712);

  // Error Colors
  /// Error state color
  final Color errorColor = const Color(0xFFB00020);
}

/// Dark theme color definitions
class _DarkColors {
  const _DarkColors();

  // Brand Colors
  /// Primary brand color
  final Color primaryColor = const Color(0xFFF2CA77); // rgb(242, 202, 119)

  // Background Colors
  /// Main background color
  final Color background = const Color(0xFF131517);
  
  // Surface Colors
  /// Surface background color with 4% opacity
  final Color surfaceBackground = const Color.fromRGBO(255, 255, 255, 0.04);
  /// Surface border color with 4% opacity
  final Color surfaceBorder = const Color.fromRGBO(255, 255, 255, 0.04);
  /// Surface button background color with 8% opacity
  final Color surfaceButtonBackground = const Color.fromRGBO(255, 255, 255, 0.08);
  /// Surface button text color with 64% opacity
  final Color surfaceButtonText = const Color.fromRGBO(255, 255, 255, 0.64);

  // Text Colors
  /// Primary header text color
  final Color textPrimaryHeader = const Color(0xFFFFFFFF);
  /// Primary body text color
  final Color textPrimaryBody = const Color(0xFFF4F5F6);
  /// Secondary text color
  final Color textSecondary = const Color(0xFF9CA3AF);
  /// Accent text color
  final Color textAccent = const Color(0xFFF2CA77);

  // Error Colors
  /// Error state color
  final Color errorColor = const Color(0xFFCF6679);
} 