import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rd_first_project/main/entity/task_entity.dart';
import 'package:rd_first_project/main/widget/nav_button.dart';
import 'package:rd_first_project/main/widget/section_header.dart';
import 'package:rd_first_project/router/route_names.dart';

final _tasks = [TaskEntity(number: 1, title: 'Мʼячик :)')];

class Homework21Screen extends StatelessWidget {
  const Homework21Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Заняття 21'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SectionHeader(
              title: 'Заняття 21 Explicit Animations',
              subtitle: 'Обери завдання',
            ),
            ...List.generate(_tasks.length, (index) {
              final task = _tasks[index];

              return NavButton(
                label: '${task.number}. ${task.title}',
                onPressed: () => context.goNamed(
                  RouteNames.task,
                  pathParameters: {
                    'number': '21',
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
