import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/entities/todo.dart';
import '../cubits/todo_cubit.dart';

/// One row in the todo list: checkbox + title + focus-time badge +
/// tap-to-timer + delete.
class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo, required this.onToggle});

  final Todo todo;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Checkbox(
              value: todo.isCompleted,
              onChanged: (_) => onToggle(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge?.copyWith(
                      decoration: todo.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                      color: todo.isCompleted
                          ? colorScheme.outline
                          : colorScheme.onSurface,
                    ),
                  ),
                  if (todo.focusSeconds > 0) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          LucideIcons.timer,
                          size: 14,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          todo.focusSeconds >= 60
                              ? '${(todo.focusSeconds / 60).toStringAsFixed(1)} min focused'
                              : '${todo.focusSeconds}s focused',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            IconButton(
              tooltip: 'Start focus timer',
              onPressed: () => context.push('/timer/${todo.id}'),
              icon: const Icon(LucideIcons.play),
              color: colorScheme.primary,
            ),
            IconButton(
              tooltip: 'Delete',
              onPressed: () => _confirmDelete(context),
              icon: const Icon(LucideIcons.trash2),
              color: colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete todo?'),
        content: Text('"${todo.title}" will be removed permanently.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      context.read<TodoCubit>().remove(todo.id);
    }
  }
}