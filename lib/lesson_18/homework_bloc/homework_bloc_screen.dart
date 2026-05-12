import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:rd_first_project/lesson_18/homework_bloc/counter_event.dart';
import 'package:rd_first_project/lesson_18/widget/counter_body.dart';

class HomeworkBlocScreen extends StatelessWidget {
  const HomeworkBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Bloc Example'),
        ),
        body: BlocBuilder<CounterBloc, int>(
          builder: (context, count) => CounterBody(
            count: count,
            onIncrement: () =>
                context.read<CounterBloc>().add(CounterIncrement()),
            onDecrement: () =>
                context.read<CounterBloc>().add(CounterDecrement()),
          ),
        ),
      ),
    );
  }
}
