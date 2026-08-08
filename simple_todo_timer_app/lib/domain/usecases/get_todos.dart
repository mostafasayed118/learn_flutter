import '../../core/entities/todo.dart';
import '../../core/error/result.dart';
import '../repositories/todo_repository.dart';

class GetTodos {
  const GetTodos(this._repository);

  final TodoRepository _repository;

  Future<Result<List<Todo>>> call() => _repository.getTodos();
}