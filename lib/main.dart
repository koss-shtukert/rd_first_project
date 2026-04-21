import 'package:flutter/material.dart';
import 'package:rd_first_project/lesson_11/homework_11_screen.dart';
import 'package:rd_first_project/main/widget/nav_button.dart';
import 'package:rd_first_project/main/widget/section_header.dart';

const _homeworks = [
  {'number': 11, 'title': 'Віджети частина 1'},
  {'number': 12, 'title': 'Віджети частина 2'},
  {'number': 13, 'title': 'Взаємодія віджетів та компонування'},
  {'number': 16, 'title': 'Найпопулярніші пакети для навігації'},
  {'number': 18, 'title': 'BloC. Ідея та основні концепти'},
  {'number': 19, 'title': 'BloC. Поєднання віджетів та бізнес-логіки'},
  {'number': 25, 'title': 'REST API'},
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RD Flutter Проєкт',
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey, title: Text('Головна')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SectionHeader(title: 'Привіт', subtitle: 'Обери заняття'),
            ...List.generate(_homeworks.length, (index) {
              final hw = _homeworks[index];
              return NavButton(
                label: '${hw['number']}. ${hw['title']}',
                onPressed: () =>
                    _navigateToHomework(context, hw['number']! as int),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _navigateToHomework(BuildContext context, int number) {
    final screen = switch (number) {
      11 => Homework11Screen(),
      _ => Scaffold(
        appBar: AppBar(
          title: Text('Заняття $number'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Text(
            'Незабаром',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    };
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => screen),
    );
  }
}
