import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_1_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_2_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_3_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_4_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_5_screen.dart';
import 'package:rd_first_project/lesson_12/hw_12_task_1_screen.dart';
import 'package:rd_first_project/lesson_13/hw_13_tasks_screen.dart';
import 'package:rd_first_project/main/screen/coming_soon_screen.dart';

class TaskEntity {
  const TaskEntity({required this.number, required this.title});

  final int number;
  final String title;

  static Widget getScreenByNumber(int lesson, int task) =>
      switch ((lesson, task)) {
        (11, 1) => const Hw11Task1Screen(),
        (11, 2) => const Hw11Task2Screen(),
        (11, 3) => const Hw11Task3Screen(),
        (11, 4) => const Hw11Task4Screen(),
        (11, 5) => const Hw11Task5Screen(),
        (12, 1) => const Hw12Task1Screen(),
        (13, 1) => const Hw13TasksScreen(),
        _ => ComingSoonScreen(number: task),
      };
}
