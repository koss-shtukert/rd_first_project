import 'package:flutter/material.dart';

class SkyWidget extends StatelessWidget {
  const SkyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1565C0), Color(0xFF81D4FA)],
          ),
        ),
      ),
    );
  }
}
