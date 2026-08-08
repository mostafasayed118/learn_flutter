import 'package:go_router/go_router.dart';

import '../../features/todo/presentation/pages/focus_timer_page.dart';
import '../../features/todo/presentation/pages/todo_list_page.dart';

/// App navigation graph:
/// - `/`          → todo list
/// - `/timer/:id` → focus timer for a specific todo
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const TodoListPage(),
      ),
      GoRoute(
        path: '/timer/:id',
        builder: (context, state) => FocusTimerPage(
          todoId: state.pathParameters['id']!,
        ),
      ),
    ],
  );
}