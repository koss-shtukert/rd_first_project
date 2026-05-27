import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_11/homework_11_screen.dart';
import 'package:rd_first_project/lesson_12/homework_12_screen.dart';
import 'package:rd_first_project/lesson_13/homework_13_screen.dart';
import 'package:rd_first_project/lesson_16/homework_16_screen.dart';
import 'package:rd_first_project/lesson_18/homework_18_screen.dart';
import 'package:rd_first_project/lesson_19/homework_19_screen.dart';
import 'package:rd_first_project/lesson_21/homework_21_screen.dart';
import 'package:rd_first_project/main/screen/coming_soon_screen.dart';

class HomeworkEntity {
  const HomeworkEntity({required this.number, required this.title});

  final int number;
  final String title;

  static Widget getScreenByNumber(int number) => switch (number) {
    11 => const Homework11Screen(),
    12 => const Homework12Screen(),
    13 => const Homework13Screen(),
    16 => const Homework16Screen(),
    18 => const Homework18Screen(),
    19 => const Homework19Screen(),
    21 => const Homework21Screen(),
    _ => ComingSoonScreen(number: number),
  };
}
