import 'package:go_router/go_router.dart';
import 'package:rd_first_project/main.dart';
import 'package:rd_first_project/main/entity/homework_entity.dart';
import 'package:rd_first_project/main/entity/task_entity.dart';
import 'package:rd_first_project/router/route_names.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.home,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'homework/:number',
          name: RouteNames.homework,
          builder: (context, state) {
            final number =
                int.tryParse(state.pathParameters['number'] ?? '') ?? 0;

            return HomeworkEntity.getScreenByNumber(number);
          },
          routes: [
            GoRoute(
              path: 'task/:taskNumber',
              name: RouteNames.task,
              builder: (context, state) {
                final lesson =
                    int.tryParse(state.pathParameters['number'] ?? '') ?? 0;
                final task =
                    int.tryParse(state.pathParameters['taskNumber'] ?? '') ?? 0;

                return TaskEntity.getScreenByNumber(lesson, task);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
