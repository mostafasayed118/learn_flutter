import '../../core/error/result.dart';
import '../repositories/todo_repository.dart';

/// Adds elapsed focus seconds to a todo — called when a timer session
/// is paused or completed.
class UpdateTimerSession {
  const UpdateTimerSession(this._repository);

  final TodoRepository _repository;

  Future<Result<void>> call(String id, int seconds) =>
      _repository.updateFocusSeconds(id, seconds);
}