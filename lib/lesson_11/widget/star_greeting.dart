import 'package:flutter/material.dart';

class StarGreeting extends StatelessWidget {
  const StarGreeting({super.key, this.isActive = true});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final icon = isActive ? Icons.star : Icons.star_border;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.yellow),
        const SizedBox(width: 10),
        Text(
          'Привіт, Flutter!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Icon(icon, color: Colors.yellow),
      ],
    );
  }
}
