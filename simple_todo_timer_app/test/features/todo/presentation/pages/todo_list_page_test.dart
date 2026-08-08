import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:simple_todo_timer_app/core/entities/todo.dart';
import 'package:simple_todo_timer_app/core/error/app_error.dart';
import 'package:simple_todo_timer_app/core/error/result.dart';
import 'package:simple_todo_timer_app/domain/usecases/add_todo.dart';
import 'package:simple_todo_timer_app/domain/usecases/delete_todo.dart';
import 'package:simple_todo_timer_app/domain/usecases/get_todos.dart';
import 'package:simple_todo_timer_app/domain/usecases/toggle_todo.dart';
import 'package:simple_todo_timer_app/features/todo/presentation/cubits/todo_cubit.dart';
import 'package:simple_todo_timer_app/features/todo/presentation/pages/todo_list_page.dart';

class MockGetTodos extends Mock implements GetTodos {}
class MockAddTodo extends Mock implements AddTodo {}
class MockDeleteTodo extends Mock implements DeleteTodo {}
class MockToggleTodo extends Mock implements ToggleTodo {}

void main() {
  late MockGetTodos mockGetTodos;
  late MockAddTodo mockAddTodo;
  late MockDeleteTodo mockDeleteTodo;
  late MockToggleTodo mockToggleTodo;

  final todo = Todo(
    id: '1',
    title: 'Buy milk',
    createdAt: DateTime(2026, 1, 1),
    focusSeconds: 65,
  );

  setUp(() {
    registerFallbackValue(
      Todo(id: 'fb', title: 'fallback', createdAt: DateTime(2026)),
    );
    mockGetTodos = MockGetTodos();
    mockAddTodo = MockAddTodo();
    mockDeleteTodo = MockDeleteTodo();
    mockToggleTodo = MockToggleTodo();
    when(() => mockAddTodo(any())).thenAnswer((_) async => Result.ok(null));
    when(() => mockDeleteTodo(any())).thenAnswer((_) async => Result.ok(null));
    when(() => mockToggleTodo(any())).thenAnswer((_) async => Result.ok(null));
  });

  TodoCubit buildCubit() => TodoCubit(
        getTodos: mockGetTodos,
        addTodo: mockAddTodo,
        deleteTodo: mockDeleteTodo,
        toggleTodo: mockToggleTodo,
      );

  Widget wrap(TodoCubit cubit) {
    cubit.load(); // mirror production wiring in main.dart
    return MaterialApp(
      home: BlocProvider<TodoCubit>.value(
        value: cubit,
        child: const TodoListPage(),
      ),
    );
  }

  testWidgets('shows empty state when there are no todos', (tester) async {
    when(() => mockGetTodos()).thenAnswer((_) async => Result.ok([]));

    final cubit = buildCubit();
    await tester.pumpWidget(wrap(cubit));
    await tester.pumpAndSettle();

    expect(find.text('No todos yet'), findsOneWidget);

    await cubit.close();
  });

  testWidgets('renders todos with titles and focus badge', (tester) async {
    when(() => mockGetTodos()).thenAnswer((_) async => Result.ok([todo]));

    final cubit = buildCubit();
    await tester.pumpWidget(wrap(cubit));
    await tester.pumpAndSettle();

    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.text('1.1 min focused'), findsOneWidget);

    await cubit.close();
  });

  testWidgets('shows error state with retry on failure', (tester) async {
    when(() => mockGetTodos()).thenAnswer(
      (_) async => Result.err(DatabaseError('Failed to load todos: boom')),
    );

    final cubit = buildCubit();
    await tester.pumpWidget(wrap(cubit));
    await tester.pumpAndSettle();

    expect(find.text('Something went wrong'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);

    when(() => mockGetTodos()).thenAnswer((_) async => Result.ok([todo]));
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.text('Buy milk'), findsOneWidget);

    await cubit.close();
  });
}