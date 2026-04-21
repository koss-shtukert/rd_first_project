import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_1_screen.dart';
import 'package:rd_first_project/widgets/nav_button.dart';
import 'package:rd_first_project/widgets/section_header.dart';

const _tasks = [
  {'number': 1, 'title': 'Базовий контейнер'},
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
