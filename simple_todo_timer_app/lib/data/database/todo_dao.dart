import 'package:hive/hive.dart';

import '../../core/entities/todo.dart';

/// Persistence abstraction over the Hive todos box.
class TodoDao {
  TodoDao(this._box);

  final Box<Todo> _box;

  List<Todo> getAll() => _box.values.toList();

  Future<void> add(Todo todo) => _box.put(todo.id, todo);

  Future<void> update(Todo todo) => _box.put(todo.id, todo);

  Future<void> delete(String id) => _box.delete(id);

  Future<Todo?> find(String id) async => _box.get(id);

  void clear() => _box.clear();

  Stream<BoxEvent> get changes => _box.watch();
}