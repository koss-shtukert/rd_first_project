import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_13/hw_13_tasks_screen.dart';
import 'package:rd_first_project/main/entity/task_entity.dart';
import 'package:rd_first_project/main/widget/nav_button.dart';
import 'package:rd_first_project/main/widget/section_header.dart';

final _tasks = [TaskEntity(number: 1, title: 'Task 1')];

class Homework13Screen extends StatelessWidget {
  const Homework13Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Заняття 13'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SectionHeader(
              title: 'Взаємодія віджетів та компонування',
              subtitle: 'Обери завдання',
            ),
            ...List.generate(_tasks.length, (index) {
              final task = _tasks[index];
              return NavButton(
                label: '${task.number}. ${task.title}',
                onPressed: () {
                  final screen = switch (task.number) {
                    1 => Hw13TasksScreen(),
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
