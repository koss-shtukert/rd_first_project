import 'package:flutter/material.dart';
import 'package:rd_first_project/widgets/blue_container.dart';
import 'package:rd_first_project/widgets/star_greeting.dart';

class Hw11Task4Screen extends StatelessWidget {
  const Hw11Task4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Завдання 4 — Різні варіанти вирівнювання'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: BlueContainer(
                color: Colors.blue,
                height: null,
                alignment: Alignment.topLeft,
                child: StarGreeting(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: BlueContainer(
              color: Colors.green,
              alignment: Alignment.center,
              child: StarGreeting(),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: BlueContainer(
              color: Colors.red,
              alignment: Alignment.bottomRight,
              child: StarGreeting(),
            ),
          ),
        ],
      ),
    );
  }
}
