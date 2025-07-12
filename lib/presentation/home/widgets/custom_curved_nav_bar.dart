import 'package:flutter/material.dart';

class CustomCurvedNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomCurvedNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedNavBarClipper(),
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF1976D2), // Blue
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, 0, 'Home'),
            _buildNavItem(Icons.settings, 1, 'Settings'),
            _buildNavItem(Icons.person, 2, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, String tooltip) {
    final isSelected = selectedIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.white70,
        size: isSelected ? 32 : 28,
      ),
      tooltip: tooltip,
      onPressed: () => onTap(index),
    );
  }
}

class CurvedNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 20);
    path.quadraticBezierTo(size.width / 2, -20, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
