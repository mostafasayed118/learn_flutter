import '../../core/entities/todo.dart';
import '../../core/error/result.dart';
import '../repositories/todo_repository.dart';

class AddTodo {
  const AddTodo(this._repository);

  final TodoRepository _repository;

  Future<Result<void>> call(Todo todo) => _repository.addTodo(todo);
}