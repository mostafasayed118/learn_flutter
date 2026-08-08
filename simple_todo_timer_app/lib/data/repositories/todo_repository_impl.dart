import 'package:hive/hive.dart';

import '../../core/entities/todo.dart';
import '../../core/error/app_error.dart';
import '../../core/error/result.dart';
import '../../domain/repositories/todo_repository.dart';
import '../database/hive_service.dart';
import '../database/todo_dao.dart';

/// Data-layer implementation of [TodoRepository]. Persists to Hive.
class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(this._dao);

  factory TodoRepositoryImpl.create({Box<Todo>? box}) =>
      TodoRepositoryImpl(TodoDao(box ?? HiveService.todosBox));

  final TodoDao _dao;

  @override
  Future<Result<List<Todo>>> getTodos() async {
    try {
      final todos = _dao.getAll();
      return Result.ok(todos);
    } catch (e) {
      return Result.err(DatabaseError('Failed to load todos: $e'));
    }
  }

  @override
  Future<Result<void>> addTodo(Todo todo) async {
    try {
      await _dao.add(todo);
      return const Result.ok(null);
    } catch (e) {
      return Result.err(DatabaseError('Failed to add todo: $e'));
    }
  }

  @override
  Future<Result<void>> deleteTodo(String id) async {
    try {
      await _dao.delete(id);
      return const Result.ok(null);
    } catch (e) {
      return Result.err(DatabaseError('Failed to delete todo: $e'));
    }
  }

  @override
  Future<Result<void>> toggleTodo(String id) async {
    try {
      final current = await _dao.find(id);
      if (current != null) {
        await _dao.update(current.copyWith(isCompleted: !current.isCompleted));
      }
      return const Result.ok(null);
    } catch (e) {
      return Result.err(DatabaseError('Failed to toggle todo: $e'));
    }
  }

  @override
  Future<Result<void>> updateFocusSeconds(String id, int seconds) async {
    try {
      final current = await _dao.find(id);
      if (current != null) {
        await _dao.update(current.copyWith(focusSeconds: seconds));
      }
      return const Result.ok(null);
    } catch (e) {
      return Result.err(DatabaseError('Failed to update focus time: $e'));
    }
  }
}