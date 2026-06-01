import 'package:flutter/material.dart';

class GrassWidget extends StatelessWidget {
  const GrassWidget({required this.grassTop, super.key});

  final double grassTop;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: grassTop,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4CAF50),
              Color(0xFF388E3C),
              Color(0xFF2E7D32),
              Color(0xFF1B5E20),
            ],
          ),
        ),
      ),
    );
  }
}
