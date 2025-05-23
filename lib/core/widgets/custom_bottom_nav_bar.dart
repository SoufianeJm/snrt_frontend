import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = theme.scaffoldBackgroundColor;
    final activeColor = Colors.white;
    final inactiveColor = Colors.grey[400];
    final indicatorColor = Colors.white.withOpacity(0.12);

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: Icons.home_rounded,
            label: 'Home',
            active: currentIndex == 0,
            activeColor: activeColor,
            inactiveColor: inactiveColor!,
            indicatorColor: indicatorColor,
            onTap: () => onTap(0),
          ),
          _NavBarItem(
            icon: Icons.play_circle_fill_rounded,
            label: 'Shorts',
            active: currentIndex == 1,
            activeColor: activeColor,
            inactiveColor: inactiveColor!,
            indicatorColor: indicatorColor,
            onTap: () => onTap(1),
          ),
          _NavBarItem(
            icon: Icons.auto_awesome_rounded,
            label: 'Chatbot',
            active: currentIndex == 2,
            activeColor: activeColor,
            inactiveColor: inactiveColor!,
            indicatorColor: indicatorColor,
            onTap: () => onTap(2),
          ),
          _NavBarItem(
            icon: Icons.settings_rounded,
            label: 'Settings',
            active: currentIndex == 3,
            activeColor: activeColor,
            inactiveColor: inactiveColor!,
            indicatorColor: indicatorColor,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final Color activeColor;
  final Color inactiveColor;
  final Color indicatorColor;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.activeColor,
    required this.inactiveColor,
    required this.indicatorColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: active ? activeColor : inactiveColor,
              size: 28,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: active ? activeColor : inactiveColor,
                fontSize: 12,
                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 