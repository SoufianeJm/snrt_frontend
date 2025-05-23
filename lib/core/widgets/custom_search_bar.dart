import 'package:flutter/material.dart';
import '../theme/text_styles.dart';
import '../theme/color_scheme.dart';

/// CustomSearchBar
///
/// Usage:
/// ```dart
/// CustomSearchBar()
/// ```
///
/// This widget is reusable and can be used on any screen.
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = isDark
        ? AppColors.dark.surfaceBackground
        : AppColors.light.surfaceBackground;
    final textColor = isDark
        ? AppColors.dark.textSecondary
        : AppColors.light.textSecondary;
    final textStyle = isDark
        ? AppTextStyles.dark.bodyMedium.copyWith(color: textColor)
        : AppTextStyles.light.bodyMedium.copyWith(color: textColor);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0), // <<--- MODIFIED PADDING HERE
      child: Container(
        height: 48.0,
        width: double.infinity,
        // Removed internal horizontal padding to allow full width
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // TODO: Place your sparkles icon in assets/icons/sparkles.png
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 12.0),
              child: Image.asset(
                'assets/icons/sparkles.png',
                width: 15,
                height: 16,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Text(
                "Try ‘Best Moroccan Movie’",
                style: textStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}