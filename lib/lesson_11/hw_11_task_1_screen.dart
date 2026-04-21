import 'package:flutter/material.dart';
import 'package:rd_first_project/widgets/blue_container.dart';

class Hw11Task1Screen extends StatelessWidget {
  const Hw11Task1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Завдання 1 — Базовий контейнер'),
      ),
      body: Center(
        child: BlueContainer(),
      ),
    );
  }
}
