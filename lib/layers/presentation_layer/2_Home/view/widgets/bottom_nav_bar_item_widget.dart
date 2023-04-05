import 'package:flutter/material.dart';

class BottomNavBarItemWidget extends StatelessWidget {
  const BottomNavBarItemWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(30.0),
          right: Radius.circular(30.0),
        ),
      ),
      child: TextButton.icon(
        label: Text(label, style: TextStyle(color: iconColor)),
        icon: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
