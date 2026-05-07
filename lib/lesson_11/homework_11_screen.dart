import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rd_first_project/main/entity/task_entity.dart';
import 'package:rd_first_project/main/widget/nav_button.dart';
import 'package:rd_first_project/main/widget/section_header.dart';
import 'package:rd_first_project/router/route_names.dart';

final _tasks = [
  TaskEntity(number: 1, title: 'Базовий контейнер'),
  TaskEntity(number: 2, title: 'Текст та іконки'),
  TaskEntity(number: 3, title: 'Робота з Column'),
  TaskEntity(number: 4, title: 'Різні варіанти вирівнювання'),
  TaskEntity(number: 5, title: 'Interactive Card Challenge'),
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
                label: '${task.number}. ${task.title}',
                onPressed: () => context.goNamed(
                  RouteNames.task,
                  pathParameters: {
                    'number': '11',
                    'taskNumber': '${task.number}',
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
