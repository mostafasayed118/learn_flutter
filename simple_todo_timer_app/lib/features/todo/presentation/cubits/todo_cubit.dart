import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/todo.dart';
import '../../../../domain/usecases/add_todo.dart';
import '../../../../domain/usecases/delete_todo.dart';
import '../../../../domain/usecases/get_todos.dart';
import '../../../../domain/usecases/toggle_todo.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {
  const TodoInitial();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  const TodoLoaded(this.todos);

  final List<Todo> todos;

  @override
  List<Object?> get props => [todos];
}

class TodoError extends TodoState {
  const TodoError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({
    required this._getTodos,
    required this._addTodo,
    required this._deleteTodo,
    required this._toggleTodo,
  }) : super(const TodoInitial());

  final GetTodos _getTodos;
  final AddTodo _addTodo;
  final DeleteTodo _deleteTodo;
  final ToggleTodo _toggleTodo;

  Future<void> load() async {
    emit(const TodoLoading());
    final result = await _getTodos();
    result.fold(
      (todos) => emit(TodoLoaded(todos)),
      (error) => emit(TodoError(error.message)),
    );
  }

  Future<void> add(String title) async {
    final trimmed = title.trim();
    if (trimmed.isEmpty) return;

    final todo = Todo(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: trimmed,
      createdAt: DateTime.now(),
    );
    final result = await _addTodo(todo);
    result.fold(
      (_) => load(),
      (error) => emit(TodoError(error.message)),
    );
  }

  Future<void> toggle(String id) async {
    final result = await _toggleTodo(id);
    result.fold((_) => load(), (error) => emit(TodoError(error.message)));
  }

  Future<void> remove(String id) async {
    final result = await _deleteTodo(id);
    result.fold((_) => load(), (error) => emit(TodoError(error.message)));
  }
}