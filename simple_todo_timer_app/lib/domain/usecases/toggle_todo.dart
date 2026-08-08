import '../../core/error/result.dart';
import '../repositories/todo_repository.dart';

class ToggleTodo {
  const ToggleTodo(this._repository);

  final TodoRepository _repository;

  Future<Result<void>> call(String id) => _repository.toggleTodo(id);
}