import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../cubits/todo_cubit.dart';
import '../widgets/empty_state.dart';
import '../widgets/todo_item.dart';

/// Main screen: list of todos with add (FAB), toggle, and delete.
/// [TodoCubit] is provided at the app root (see `main.dart`) so the
/// list and the focus timer share the same state.
class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TodoListView();
  }
}

class _TodoListView extends StatelessWidget {
  const _TodoListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Todos')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        tooltip: 'Add todo',
        child: const Icon(LucideIcons.plus),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return switch (state) {
            TodoInitial() || TodoLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            TodoError(:final message) => _ErrorView(
                message: message,
                onRetry: () => context.read<TodoCubit>().load(),
              ),
            TodoLoaded(:final todos) => todos.isEmpty
                ? const EmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return TodoItem(
                        todo: todo,
                        onToggle: () =>
                            context.read<TodoCubit>().toggle(todo.id),
                      );
                    },
                  ),
          };
        },
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context) async {
    final controller = TextEditingController();
    final title = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('New todo'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'What do you need to do?'),
          onSubmitted: (value) => Navigator.pop(dialogContext, value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, controller.text),
            child: const Text('Add'),
          ),
        ],
      ),
    );

    if (title != null && title.trim().isNotEmpty && context.mounted) {
      context.read<TodoCubit>().add(title);
    }
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.alertCircle,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 12),
            const Text('Something went wrong'),
            const SizedBox(height: 4),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            FilledButton.tonal(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}