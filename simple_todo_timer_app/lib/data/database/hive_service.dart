import 'package:hive_flutter/hive_flutter.dart';

import '../../core/entities/todo.dart';
import '../models/todo_adapter.dart';

/// Bootstraps Hive storage: registers adapters and opens the todo box
/// before `runApp` so the repository is ready synchronously afterwards.
class HiveService {
  HiveService._();

  static const String _todosBoxName = 'todos';

  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TodoAdapter());
    }
    await Hive.openBox<Todo>(_todosBoxName);
  }

  static Box<Todo> get todosBox => Hive.box<Todo>(_todosBoxName);
}