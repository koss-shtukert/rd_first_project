import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_11/widget/column_container.dart';
import 'package:rd_first_project/lesson_11/widget/star_greeting.dart';

const _containers = [
  {'color': Colors.blue, 'alignment': Alignment.topLeft},
  {'color': Colors.green, 'alignment': Alignment.center},
  {'color': Colors.red, 'alignment': Alignment.bottomRight},
];

class Hw11Task5Screen extends StatefulWidget {
  const Hw11Task5Screen({super.key});

  @override
  State<Hw11Task5Screen> createState() => _Hw11Task5ScreenState();
}

class _Hw11Task5ScreenState extends State<Hw11Task5Screen> {
  final _pressed = <int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Завдання 5 — Interactive Card Challenge'),
      ),
      body: ColumnContainer(
        containers: _containers,
        itemBuilder: (index, item) {
          final isActive = _pressed.contains(index);
          final baseColor = item['color'] as MaterialColor;
          final alignment = item['alignment'] as Alignment;

          return GestureDetector(
            onTap: () => setState(() {
              isActive ? _pressed.remove(index) : _pressed.add(index);
            }),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 300,
              height: index == 0 ? null : 150,
              padding: const EdgeInsets.all(10),
              alignment: alignment,
              decoration: BoxDecoration(
                color: isActive ? baseColor.shade900 : baseColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: isActive
                    ? [BoxShadow(color: Colors.yellow, blurRadius: 8)]
                    : [],
              ),
              child: StarGreeting(isActive: isActive),
            ),
          );
        },
      ),
    );
  }
}
