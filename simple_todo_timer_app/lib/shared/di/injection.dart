import 'package:get_it/get_it.dart';

import '../../data/database/hive_service.dart';
import '../../data/database/todo_dao.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/repositories/todo_repository.dart';
import '../../domain/usecases/add_todo.dart';
import '../../domain/usecases/delete_todo.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/toggle_todo.dart';
import '../../domain/usecases/update_timer_session.dart';
import '../../features/todo/presentation/cubits/todo_cubit.dart';
import '../../features/todo/presentation/cubits/timer_cubit.dart';

final GetIt sl = GetIt.instance;

/// Registers the full dependency graph. Call once from `main()`.
Future<void> initDependencies() async {
  await HiveService.init();

  final dao = TodoDao(HiveService.todosBox);
  final repository = TodoRepositoryImpl(dao);

  sl
    ..registerLazySingleton<TodoDao>(() => dao)
    ..registerLazySingleton<TodoRepository>(() => repository)
    ..registerLazySingleton(() => GetTodos(repository))
    ..registerLazySingleton(() => AddTodo(repository))
    ..registerLazySingleton(() => DeleteTodo(repository))
    ..registerLazySingleton(() => ToggleTodo(repository))
    ..registerLazySingleton(() => UpdateTimerSession(repository))
    ..registerFactory<TodoCubit>(() => TodoCubit(
          getTodos: sl(),
          addTodo: sl(),
          deleteTodo: sl(),
          toggleTodo: sl(),
        ))
    ..registerFactory<TimerCubit>(() => TimerCubit(
          updateTimerSession: sl(),
        ));
}