import '../../core/error/result.dart';
import '../repositories/todo_repository.dart';

class DeleteTodo {
  const DeleteTodo(this._repository);

  final TodoRepository _repository;

  Future<Result<void>> call(String id) => _repository.deleteTodo(id);
}