import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_1_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_2_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_3_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_4_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_5_screen.dart';
import 'package:rd_first_project/main/widget/nav_button.dart';
import 'package:rd_first_project/main/widget/section_header.dart';

const _tasks = [
  {'number': 1, 'title': 'Базовий контейнер'},
  {'number': 2, 'title': 'Текст та іконки'},
  {'number': 3, 'title': 'Робота з Column'},
  {'number': 4, 'title': 'Різні варіанти вирівнювання'},
  {'number': 5, 'title': 'Interactive Card Challenge'},
];

class Homework11Screen extends StatelessWidget {
  const Homework11Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Заняття 11'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SectionHeader(
              title: 'Віджети частина 1',
              subtitle: 'Обери завдання',
            ),
            ...List.generate(_tasks.length, (index) {
              final task = _tasks[index];
              return NavButton(
                label: '${task['number']}. ${task['title']}',
                onPressed: () {
                  final screen = switch (task['number']) {
                    1 => Hw11Task1Screen(),
                    2 => Hw11Task2Screen(),
                    3 => Hw11Task3Screen(),
                    4 => Hw11Task4Screen(),
                    5 => Hw11Task5Screen(),
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
