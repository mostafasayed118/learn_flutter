import '../../core/entities/todo.dart';
import '../../core/error/result.dart';

/// Domain contract the presentation layer depends on.
abstract interface class TodoRepository {
  Future<Result<List<Todo>>> getTodos();

  Future<Result<void>> addTodo(Todo todo);

  Future<Result<void>> deleteTodo(String id);

  Future<Result<void>> toggleTodo(String id);

  Future<Result<void>> updateFocusSeconds(String id, int seconds);
}