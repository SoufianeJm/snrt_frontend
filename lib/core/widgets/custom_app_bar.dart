import 'package:flutter/material.dart';

/// CustomAppBar
///
/// Usage:
/// ```dart
/// Scaffold(
///   appBar: PreferredSize(
///     preferredSize: Size.fromHeight(56),
///     child: CustomAppBar(),
///   ),
///   body: ...,
/// )
/// ```
///
/// This widget is reusable and can be used on any screen.
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TODO: Place your logo asset in assets/images/trend_logo.png
            Image.asset(
              'assets/images/trend_logo.png',
              width: 100,
              fit: BoxFit.contain,
            ),
            // TODO: Place your notification icon in assets/icons/notification.png
            Image.asset(
              'assets/icons/notification.png',
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
} 