import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:simple_todo_timer_app/core/entities/todo.dart';
import 'package:simple_todo_timer_app/core/error/app_error.dart';
import 'package:simple_todo_timer_app/data/database/todo_dao.dart';
import 'package:simple_todo_timer_app/data/models/todo_adapter.dart';
import 'package:simple_todo_timer_app/data/repositories/todo_repository_impl.dart';

void main() {
  late Directory tempDir;
  late Box<Todo> box;
  late TodoRepositoryImpl repository;

  Todo sampleTodo({bool isCompleted = false, int focusSeconds = 0}) => Todo(
        id: '1',
        title: 'Write tests',
        isCompleted: isCompleted,
        focusSeconds: focusSeconds,
        createdAt: DateTime(2026, 1, 1),
      );

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('todo_hive_test');
    Hive.init(tempDir.path);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TodoAdapter());
    }
    box = await Hive.openBox<Todo>('todos');
    repository = TodoRepositoryImpl(TodoDao(box));
  });

  tearDown(() async {
    await box.close();
    await Hive.deleteFromDisk();
    await tempDir.delete(recursive: true);
  });

  group('TodoRepositoryImpl', () {
    test('addTodo persists and getTodos returns it', () async {
      final todo = sampleTodo();

      final addResult = await repository.addTodo(todo);
      final getResult = await repository.getTodos();

      expect(addResult.isSuccess, isTrue);
      expect(getResult.requireValue, [todo]);
    });

    test('toggleTodo flips isCompleted', () async {
      await repository.addTodo(sampleTodo());

      final result = await repository.toggleTodo('1');

      expect(result.isSuccess, isTrue);
      final todos = (await repository.getTodos()).requireValue;
      expect(todos.single.isCompleted, isTrue);
    });

    test('deleteTodo removes the todo', () async {
      await repository.addTodo(sampleTodo());
      await repository.addTodo(sampleTodo().copyWith(id: '2', title: 'Other'));

      final result = await repository.deleteTodo('1');

      expect(result.isSuccess, isTrue);
      final todos = (await repository.getTodos()).requireValue;
      expect(todos.map((t) => t.id), ['2']);
    });

    test('updateFocusSeconds accumulates focus time', () async {
      await repository.addTodo(sampleTodo());

      final result = await repository.updateFocusSeconds('1', 1500);

      expect(result.isSuccess, isTrue);
      final todo = (await repository.getTodos()).requireValue.single;
      expect(todo.focusSeconds, 1500);
    });

    test('toggleTodo on missing id is a no-op success', () async {
      final result = await repository.toggleTodo('nope');

      expect(result.isSuccess, isTrue);
      expect((await repository.getTodos()).requireValue, isEmpty);
    });

    test('failing box operations surface a DatabaseError', () async {
      await box.close();
      await Hive.deleteFromDisk();

      final result = await repository.getTodos();

      expect(result.isFailure, isTrue);
      expect(result.fold((_) => null, (e) => e), isA<DatabaseError>());
    });
  });
}