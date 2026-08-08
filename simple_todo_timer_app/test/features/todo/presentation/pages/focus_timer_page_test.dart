import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:simple_todo_timer_app/core/entities/todo.dart';
import 'package:simple_todo_timer_app/core/error/result.dart';
import 'package:simple_todo_timer_app/domain/usecases/add_todo.dart';
import 'package:simple_todo_timer_app/domain/usecases/delete_todo.dart';
import 'package:simple_todo_timer_app/domain/usecases/get_todos.dart';
import 'package:simple_todo_timer_app/domain/usecases/toggle_todo.dart';
import 'package:simple_todo_timer_app/domain/usecases/update_timer_session.dart';
import 'package:simple_todo_timer_app/features/todo/presentation/cubits/timer_cubit.dart';
import 'package:simple_todo_timer_app/features/todo/presentation/cubits/todo_cubit.dart';
import 'package:simple_todo_timer_app/features/todo/presentation/pages/focus_timer_page.dart';

class MockUpdateTimerSession extends Mock implements UpdateTimerSession {}
class MockGetTodos extends Mock implements GetTodos {}
class MockAddTodo extends Mock implements AddTodo {}
class MockDeleteTodo extends Mock implements DeleteTodo {}
class MockToggleTodo extends Mock implements ToggleTodo {}

void main() {
  late final GetIt sl;
  late MockUpdateTimerSession mockUpdate;
  late MockGetTodos mockGetTodos;
  late MockAddTodo mockAddTodo;
  late MockDeleteTodo mockDeleteTodo;
  late MockToggleTodo mockToggleTodo;

  final todo = Todo(
    id: '1',
    title: 'Deep work',
    createdAt: DateTime(2026, 1, 1),
  );

  setUp(() {
    registerFallbackValue(
      Todo(id: 'fb', title: 'fallback', createdAt: DateTime(2026)),
    );
    sl = GetIt.instance;
    mockUpdate = MockUpdateTimerSession();
    when(() => mockUpdate(any(), any())).thenAnswer(
      (_) async => Result.ok(null),
    );
    mockGetTodos = MockGetTodos();
    when(() => mockGetTodos()).thenAnswer((_) async => Result.ok([todo]));
    mockAddTodo = MockAddTodo();
    when(() => mockAddTodo(any())).thenAnswer((_) async => Result.ok(null));
    mockDeleteTodo = MockDeleteTodo();
    when(() => mockDeleteTodo(any())).thenAnswer((_) async => Result.ok(null));
    mockToggleTodo = MockToggleTodo();
    when(() => mockToggleTodo(any())).thenAnswer((_) async => Result.ok(null));

    // FocusTimerPage resolves TimerCubit via GetIt — register the test one.
    sl.registerFactory<TimerCubit>(() => TimerCubit(
          updateTimerSession: mockUpdate,
        ));
  });

  tearDown(() {
    sl.unregister<TimerCubit>();
  });

  Widget wrap() => MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<TodoCubit>.value(
              value: TodoCubit(
                getTodos: mockGetTodos,
                addTodo: mockAddTodo,
                deleteTodo: mockDeleteTodo,
                toggleTodo: mockToggleTodo,
              )..load(),
            ),
          ],
          child: const FocusTimerPage(todoId: '1'),
        ),
      );

  testWidgets('shows todo title and MM:SS display', (tester) async {
    await tester.pumpWidget(wrap());
    await tester.pump();
    await tester.pump();

    expect(find.text('Deep work'), findsOneWidget);
    expect(find.text('00:00'), findsOneWidget);
    expect(find.text('Focus Timer'), findsOneWidget);
  });
}