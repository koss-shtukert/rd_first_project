import 'package:flutter/material.dart';
import 'package:rd_first_project/widgets/blue_container.dart';
import 'package:rd_first_project/widgets/star_greeting.dart';

class Hw11Task2Screen extends StatelessWidget {
  const Hw11Task2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Завдання 2 — Текст та іконки'),
      ),
      body: Center(child: BlueContainer(child: StarGreeting())),
    );
  }
}
