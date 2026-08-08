import 'package:bloc_test/bloc_test.dart';
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
  );

setUp(() {
    registerFallbackValue(
      Todo(id: 'fb', title: 'fallback', createdAt: DateTime(2026)),
    );
    mockGetTodos = MockGetTodos();
    mockAddTodo = MockAddTodo();
    mockDeleteTodo = MockDeleteTodo();
    mockToggleTodo = MockToggleTodo();
  });

  TodoCubit buildCubit() => TodoCubit(
        getTodos: mockGetTodos,
        addTodo: mockAddTodo,
        deleteTodo: mockDeleteTodo,
        toggleTodo: mockToggleTodo,
      );

  group('TodoCubit', () {
    blocTest<TodoCubit, TodoState>(
      'emits Loading then Loaded with todos',
      setUp: () {
        when(() => mockGetTodos()).thenAnswer(
          (_) async => Result.ok([todo]),
        );
      },
      build: buildCubit,
      act: (cubit) => cubit.load(),
      expect: () => [
        const TodoLoading(),
        TodoLoaded([todo]),
      ],
    );

    blocTest<TodoCubit, TodoState>(
      'emits Loading then Error on failure',
      setUp: () {
        when(() => mockGetTodos()).thenAnswer(
          (_) async => Result.err(const DatabaseError('boom')),
        );
      },
      build: buildCubit,
      act: (cubit) => cubit.load(),
      expect: () => [
        const TodoLoading(),
        const TodoError('boom'),
      ],
    );

    blocTest<TodoCubit, TodoState>(
      'adds a todo and reloads the list',
      setUp: () {
        when(() => mockGetTodos()).thenAnswer((_) async => Result.ok([todo]));
        when(() => mockAddTodo(any())).thenAnswer(
          (_) async => const Result.ok(null),
        );
      },
      build: buildCubit,
      seed: () => TodoLoaded([todo]),
      act: (cubit) => cubit.add('Buy bread'),
      expect: () => [TodoLoading(), TodoLoaded([todo])],
    );

    blocTest<TodoCubit, TodoState>(
      'does not create todos from blank titles',
      setUp: () {
        when(() => mockAddTodo(any())).thenAnswer(
          (_) async => const Result.ok(null),
        );
      },
      build: buildCubit,
      seed: () => TodoLoaded([todo]),
      act: (cubit) => cubit.add('   '),
      expect: () => const <TodoState>[],
    );

    blocTest<TodoCubit, TodoState>(
      'toggles a todo and reloads',
      setUp: () {
        when(() => mockGetTodos()).thenAnswer(
          (_) async => Result.ok([todo.copyWith(isCompleted: true)]),
        );
        when(() => mockToggleTodo('1')).thenAnswer(
          (_) async => const Result.ok(null),
        );
      },
      build: buildCubit,
      seed: () => TodoLoaded([todo]),
      act: (cubit) => cubit.toggle('1'),
      expect: () => [
        const TodoLoading(),
        TodoLoaded([todo.copyWith(isCompleted: true)]),
      ],
    );

    blocTest<TodoCubit, TodoState>(
      'deletes a todo and reloads',
      setUp: () {
        when(() => mockGetTodos()).thenAnswer((_) async => Result.ok([]));
        when(() => mockDeleteTodo('1')).thenAnswer(
          (_) async => const Result.ok(null),
        );
      },
      build: buildCubit,
      seed: () => TodoLoaded([todo]),
      act: (cubit) => cubit.remove('1'),
      expect: () => const [TodoLoading(), TodoLoaded([])],
    );
  });
}

