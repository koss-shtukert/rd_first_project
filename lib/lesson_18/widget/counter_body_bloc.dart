import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:rd_first_project/main/widget/nav_button.dart';

class CounterBodyBloc extends StatelessWidget {
  const CounterBodyBloc({
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

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
          BlocBuilder<CounterBloc, int>(
            builder: (context, count) => Text(
              '$count',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
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
