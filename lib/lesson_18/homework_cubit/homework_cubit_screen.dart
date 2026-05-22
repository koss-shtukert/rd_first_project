import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_18/homework_cubit/counter_cubit.dart';
import 'package:rd_first_project/lesson_18/widget/counter_body_cubit.dart';

class HomeworkCubitScreen extends StatelessWidget {
  const HomeworkCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Cubit Example'),
        ),
        body: Builder(
          builder: (context) => CounterBodyCubit(
            onIncrement: () => context.read<CounterCubit>().increment(),
            onDecrement: () => context.read<CounterCubit>().decrement(),
          ),
        ),
      ),
    );
  }
}
