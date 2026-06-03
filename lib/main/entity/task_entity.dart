import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_1_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_2_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_3_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_4_screen.dart';
import 'package:rd_first_project/lesson_11/hw_11_task_5_screen.dart';
import 'package:rd_first_project/lesson_12/hw_12_task_1_screen.dart';
import 'package:rd_first_project/lesson_13/hw_13_tasks_screen.dart';
import 'package:rd_first_project/lesson_18/homework_bloc/homework_bloc_screen.dart';
import 'package:rd_first_project/lesson_18/homework_cubit/homework_cubit_screen.dart';
import 'package:rd_first_project/lesson_19/hw_19_task_1_screen.dart';
import 'package:rd_first_project/lesson_21/hw_21_task_1_screen.dart';
import 'package:rd_first_project/lesson_22/presentation/ui/screens/user_profile_homework_screen.dart';
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
        (18, 1) => const HomeworkCubitScreen(),
        (18, 2) => const HomeworkBlocScreen(),
        (19, 1) => const Hw19Task1Screen(),
        (21, 1) => const Hw21Task1Screen(),
        (22, 1) => const UserProfileHomeworkScreen(),
        _ => ComingSoonScreen(number: lesson),
      };
}
