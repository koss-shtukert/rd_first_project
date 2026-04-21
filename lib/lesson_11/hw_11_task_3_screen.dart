import 'package:flutter/material.dart';
import 'package:rd_first_project/widgets/blue_container.dart';
import 'package:rd_first_project/widgets/star_greeting.dart';

const _colors = [Colors.blue, Colors.green, Colors.red];

class Hw11Task3Screen extends StatelessWidget {
  const Hw11Task3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Завдання 3 — Робота з Column'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final (i, color) in _colors.indexed) ...[
              if (i > 0) const SizedBox(height: 8),
              BlueContainer(color: color, child: StarGreeting()),
            ],
          ],
        ),
      ),
    );
  }
}
