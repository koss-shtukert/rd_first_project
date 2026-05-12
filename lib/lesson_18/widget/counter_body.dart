import 'package:flutter/material.dart';
import 'package:rd_first_project/main/widget/nav_button.dart';

class CounterBody extends StatelessWidget {
  const CounterBody({
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Кількість натискань:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            '$count',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: NavButton(label: '-', onPressed: onDecrement),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 150,
                child: NavButton(label: '+', onPressed: onIncrement),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
