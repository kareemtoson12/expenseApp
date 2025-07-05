import 'package:flutter/material.dart';
import 'package:expense/app/styles/bottom_nav_styles.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;
  final VoidCallback? onFabTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    this.onFabTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: BottomNavStyles.barHeight + 24,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Bar background
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Material(
              elevation: BottomNavStyles.barElevation,
              color: BottomNavStyles.barBackground,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: SizedBox(
                height: BottomNavStyles.barHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _NavIcon(
                      icon: Icon(
                        Icons.home,
                        color: selectedIndex == 0
                            ? BottomNavStyles.iconColorActive
                            : BottomNavStyles.iconColor,
                        size: BottomNavStyles.iconSize,
                      ),
                      selected: selectedIndex == 0,
                      onTap: () => onTap(0),
                    ),
                    _NavIcon(
                      icon: Image.asset(
                        'assets/png/task.png',
                        width: BottomNavStyles.iconSize,
                        height: BottomNavStyles.iconSize,
                        color: selectedIndex == 1
                            ? BottomNavStyles.iconColorActive
                            : BottomNavStyles.iconColor,
                      ),
                      selected: selectedIndex == 1,
                      onTap: () => onTap(1),
                    ),
                    const SizedBox(width: BottomNavStyles.fabSize),
                    _NavIcon(
                      icon: Icon(
                        Icons.notifications_none_rounded,
                        color: selectedIndex == 2
                            ? BottomNavStyles.iconColorActive
                            : BottomNavStyles.iconColor,
                        size: BottomNavStyles.iconSize,
                      ),
                      selected: selectedIndex == 2,
                      showDot: true,
                      onTap: () => onTap(2),
                    ),
                    _NavIcon(
                      icon: Icon(
                        Icons.settings_outlined,
                        color: selectedIndex == 3
                            ? BottomNavStyles.iconColorActive
                            : BottomNavStyles.iconColor,
                        size: BottomNavStyles.iconSize,
                      ),
                      selected: selectedIndex == 3,
                      onTap: () => onTap(3),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Center FAB
          Positioned(
            bottom: BottomNavStyles.barHeight - BottomNavStyles.fabSize / 1.2,
            child: GestureDetector(
              onTap: onFabTap,
              child: Material(
                elevation: BottomNavStyles.fabElevation,
                shape: const CircleBorder(),
                child: Container(
                  width: BottomNavStyles.fabSize,
                  height: BottomNavStyles.fabSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: BottomNavStyles.fabGradient,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: BottomNavStyles.fabIconColor,
                      size: BottomNavStyles.fabIconSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final Widget icon;
  final bool selected;
  final bool showDot;
  final VoidCallback? onTap;

  const _NavIcon({
    required this.icon,
    this.selected = false,
    this.showDot = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          icon,
          if (showDot)
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                width: BottomNavStyles.notificationDotSize,
                height: BottomNavStyles.notificationDotSize,
                decoration: BoxDecoration(
                  color: BottomNavStyles.notificationDot,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
