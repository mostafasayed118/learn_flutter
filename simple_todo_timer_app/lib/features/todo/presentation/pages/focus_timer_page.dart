import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/entities/todo.dart';
import '../../../../shared/di/injection.dart';
import '../cubits/timer_cubit.dart';
import '../cubits/todo_cubit.dart';
import '../widgets/timer_display.dart';

/// Focus session screen for a single todo. Starts the timer on entry,
/// persists elapsed seconds on pause/complete, and offers reset.
class FocusTimerPage extends StatelessWidget {
  const FocusTimerPage({super.key, required this.todoId});

  final String todoId;

  Todo? _findTodo(TodoState state) {
    if (state is TodoLoaded) {
      for (final todo in state.todos) {
        if (todo.id == todoId) return todo;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerCubit>(
      create: (context) => sl<TimerCubit>()..start(todoId),
      child: Builder(
        builder: (context) {
          return BlocBuilder<TodoCubit, TodoState>(
            builder: (context, todoState) {
              final todo = _findTodo(todoState);
              final title = todo?.title ?? 'Focus Session';

              return Scaffold(
                appBar: AppBar(
                  title: const Text('Focus Timer'),
                  actions: [
                    IconButton(
                      tooltip: 'Complete session',
                      onPressed: () async {
                        await context.read<TimerCubit>().complete();
                        if (context.mounted) Navigator.pop(context);
                      },
                      icon: const Icon(LucideIcons.check),
                    ),
                  ],
                ),
                body: todo == null
                    ? const _MissingTodoView()
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: TimerDisplay(todoTitle: title),
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}

class _MissingTodoView extends StatelessWidget {
  const _MissingTodoView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This todo no longer exists.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}