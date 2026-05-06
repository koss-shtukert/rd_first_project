import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_12/hw_12_task_1_screen.dart';
import 'package:rd_first_project/main/entity/task_entity.dart';
import 'package:rd_first_project/main/widget/nav_button.dart';
import 'package:rd_first_project/main/widget/section_header.dart';

final _tasks = [TaskEntity(number: 1, title: 'Оцінка візиту до магазину')];

class Homework12Screen extends StatelessWidget {
  const Homework12Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Заняття 12'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SectionHeader(
              title: 'Віджети частина 2',
              subtitle: 'Обери завдання',
            ),
            ...List.generate(_tasks.length, (index) {
              final task = _tasks[index];
              return NavButton(
                label: '${task.number}. ${task.title}',
                onPressed: () {
                  final screen = switch (task.number) {
                    1 => Hw12Task1Screen(),
                    _ => throw UnimplementedError(),
                  };
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(builder: (context) => screen),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
