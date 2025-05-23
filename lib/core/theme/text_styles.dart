import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_scheme.dart';

/// A comprehensive text style system for the app.
/// 
/// Usage in widgets:
/// ```dart
/// Text(
///   'Hello World',
///   style: AppTextStyles.light.headlineLarge,
/// )
/// ```
/// 
/// Usage in ThemeData:
/// ```dart
/// ThemeData(
///   textTheme: TextTheme(
///     headlineLarge: AppTextStyles.light.headlineLarge,
///     bodyLarge: AppTextStyles.light.bodyLarge,
///   ),
/// )
/// ```
class AppTextStyles {
  /// Light theme text styles
  static final _LightTextStyles light = _LightTextStyles();
  
  /// Dark theme text styles
  static final _DarkTextStyles dark = _DarkTextStyles();
}

/// Base class for text styles with common properties
abstract class _BaseTextStyles {
  /// Get the base font family based on platform
  String? get baseFontFamily => Platform.isAndroid ? GoogleFonts.inter().fontFamily : null;

  /// Get the base text style with common properties
  TextStyle get baseStyle => TextStyle(
    fontFamily: baseFontFamily,
    height: 1.4, // Default line height
  );

  // Headings
  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;

  // Body
  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;

  // Caption
  TextStyle get caption;

  // Button
  TextStyle get button;
}

/// Light theme text styles
class _LightTextStyles extends _BaseTextStyles {
  @override
  TextStyle get headlineLarge => baseStyle.copyWith(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.light.textPrimaryHeader,
    height: 1.3,
  );

  @override
  TextStyle get headlineMedium => baseStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600, // semi-bold
    color: AppColors.light.textPrimaryHeader,
    height: 1.3,
  );

  @override
  TextStyle get headlineSmall => baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500, // medium
    color: AppColors.light.textPrimaryHeader,
    height: 1.3,
  );

  @override
  TextStyle get bodyLarge => baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.light.textPrimaryBody,
    height: 1.5,
  );

  @override
  TextStyle get bodyMedium => baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.light.textPrimaryBody,
    height: 1.5,
  );

  @override
  TextStyle get bodySmall => baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.light.textPrimaryBody,
    height: 1.5,
  );

  @override
  TextStyle get caption => baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w300, // light
    color: AppColors.light.textSecondary,
    height: 1.5,
  );

  @override
  TextStyle get button => baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    color: AppColors.light.primaryColor,
    height: 1.4,
    letterSpacing: 0.5,
  );
}

/// Dark theme text styles
class _DarkTextStyles extends _BaseTextStyles {
  @override
  TextStyle get headlineLarge => baseStyle.copyWith(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.dark.textPrimaryHeader,
    height: 1.3,
  );

  @override
  TextStyle get headlineMedium => baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600, // semi-bold
    color: AppColors.dark.textPrimaryHeader,
    height: 1.3,
  );

  @override
  TextStyle get headlineSmall => baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500, // medium
    color: AppColors.dark.textPrimaryHeader,
    height: 1.3,
  );

  @override
  TextStyle get bodyLarge => baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.dark.textPrimaryBody,
    height: 1.5,
  );

  @override
  TextStyle get bodyMedium => baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.dark.textPrimaryBody,
    height: 1.5,
  );

  @override
  TextStyle get bodySmall => baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.dark.textPrimaryBody,
    height: 1.5,
  );

  @override
  TextStyle get caption => baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w300, // light
    color: AppColors.dark.textSecondary,
    height: 1.5,
  );

  @override
  TextStyle get button => baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    color: AppColors.dark.primaryColor,
    height: 1.4,
    letterSpacing: 0.5,
  );
} 