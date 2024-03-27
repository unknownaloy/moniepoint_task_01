import 'package:flutter/material.dart';

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor:
            isActive ? const Color(0xffFC9E12) : const Color(0xff232220),
        radius: isActive ? 26 : 20,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
