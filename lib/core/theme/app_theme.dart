import 'package:flutter/material.dart';
import 'color_scheme.dart';
import 'text_styles.dart';

class AppTheme {
  // Primary colors
  static const Color _primaryLight = Color(0xFF6A1B9A);
  static const Color _primaryDark = Color(0xFF9C4DCC);

  // Background colors
  static const Color _scaffoldBackgroundLight = Color(0xFFF5F5F5);
  static const Color _scaffoldBackgroundDark = Color(0xFF121212);

  // Text colors
  static const Color _textPrimaryLight = Color(0xFF000000);
  static const Color _textPrimaryDark = Color(0xFFFFFFFF);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.light.primaryColor,
      scaffoldBackgroundColor: AppColors.light.background,
      colorScheme: ColorScheme.light(
        primary: AppColors.light.primaryColor,
        secondary: AppColors.light.primaryColor.withOpacity(0.8),
        surface: AppColors.light.surfaceBackground,
        background: AppColors.light.background,
        error: AppColors.light.errorColor,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.light.headlineLarge,
        headlineMedium: AppTextStyles.light.headlineMedium,
        headlineSmall: AppTextStyles.light.headlineSmall,
        bodyLarge: AppTextStyles.light.bodyLarge,
        bodyMedium: AppTextStyles.light.bodyMedium,
        bodySmall: AppTextStyles.light.bodySmall,
        labelLarge: AppTextStyles.light.button,
        labelMedium: AppTextStyles.light.button,
        labelSmall: AppTextStyles.light.caption,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.light.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: AppTextStyles.light.button,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.light.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: AppTextStyles.light.headlineSmall.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.dark.primaryColor,
      scaffoldBackgroundColor: AppColors.dark.background,
      colorScheme: ColorScheme.dark(
        primary: AppColors.dark.primaryColor,
        secondary: AppColors.dark.primaryColor.withOpacity(0.8),
        surface: AppColors.dark.surfaceBackground,
        background: AppColors.dark.background,
        error: AppColors.dark.errorColor,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.dark.headlineLarge,
        headlineMedium: AppTextStyles.dark.headlineMedium,
        headlineSmall: AppTextStyles.dark.headlineSmall,
        bodyLarge: AppTextStyles.dark.bodyLarge,
        bodyMedium: AppTextStyles.dark.bodyMedium,
        bodySmall: AppTextStyles.dark.bodySmall,
        labelLarge: AppTextStyles.dark.button,
        labelMedium: AppTextStyles.dark.button,
        labelSmall: AppTextStyles.dark.caption,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.dark.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: AppTextStyles.dark.button,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.dark.background,
        foregroundColor: AppColors.dark.textPrimaryHeader,
        elevation: 0,
        titleTextStyle: AppTextStyles.dark.headlineSmall,
      ),
    );
  }
} 