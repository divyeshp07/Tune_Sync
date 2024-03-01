import 'package:flutter/material.dart';

class PopupMenuItemWidget extends StatelessWidget {
  final Function() onTap;
  final String value;
  final IconData icon;
  final String text;

  PopupMenuItemWidget({
    super.key,
    required this.onTap,
    required this.value,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem(
      onTap: onTap,
      value: value,
      child: Row(
        children: [
          Icon(icon, color: Colors.white), // Set icon color to white
          const SizedBox(width: 8), // Add some spacing
          Text(text,
              style: const TextStyle(
                  color: Colors.white)), // Set text color to white
        ],
      ),
    );
  }
}
