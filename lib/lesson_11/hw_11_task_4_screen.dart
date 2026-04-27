import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_11/entity/container_entity.dart';
import 'package:rd_first_project/lesson_11/widget/colored_container.dart';
import 'package:rd_first_project/lesson_11/widget/column_container.dart';
import 'package:rd_first_project/lesson_11/widget/star_greeting.dart';

const _containers = [
  ContainerEntity(color: Colors.blue, alignment: Alignment.topLeft),
  ContainerEntity(color: Colors.green, alignment: Alignment.center),
  ContainerEntity(color: Colors.red, alignment: Alignment.bottomRight),
];

class Hw11Task4Screen extends StatelessWidget {
  const Hw11Task4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Завдання 4 — Різні варіанти вирівнювання'),
      ),
      body: ColumnContainer(
        containers: _containers,
        itemBuilder: (index, item) => ColoredContainer(
          color: item.color,
          height: index == 0 ? null : 150,
          alignment: item.alignment as Alignment,
          child: StarGreeting(),
        ),
      ),
    );
  }
}
