import 'package:flutter/material.dart';

class StarGreeting extends StatelessWidget {
  const StarGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.yellow),
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
        Icon(Icons.star, color: Colors.yellow),
      ],
    );
  }
}
