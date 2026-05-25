import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_bloc.dart';
import 'package:rd_first_project/main/entity/homework_entity.dart';
import 'package:rd_first_project/main/widget/nav_button.dart';
import 'package:rd_first_project/main/widget/section_header.dart';
import 'package:rd_first_project/router/app_router.dart';
import 'package:rd_first_project/router/route_names.dart';

const _homeworks = [
  HomeworkEntity(number: 11, title: 'Віджети частина 1'),
  HomeworkEntity(number: 12, title: 'Віджети частина 2'),
  HomeworkEntity(number: 13, title: 'Взаємодія віджетів та компонування'),
  HomeworkEntity(number: 16, title: 'Найпопулярніші пакети для навігації'),
  HomeworkEntity(number: 18, title: 'BloC. Ідея та основні концепти'),
  HomeworkEntity(
    number: 19,
    title: 'BloC. Поєднання віджетів та бізнес-логіки',
  ),
  HomeworkEntity(number: 25, title: 'REST API'),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RatingBloc(),
      child: MaterialApp.router(
        title: 'RD Flutter Проєкт',
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'SilpoText'),
        ),
        routerConfig: appRouter,
      ),
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
                label: '${hw.number}. ${hw.title}',
                onPressed: () => context.goNamed(
                  RouteNames.homework,
                  pathParameters: {'number': '${hw.number}'},
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
