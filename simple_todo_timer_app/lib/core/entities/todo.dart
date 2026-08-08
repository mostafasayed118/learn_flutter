import 'package:equatable/equatable.dart';

/// Core [Todo] entity — a pure domain object with no framework dependencies.
class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.title,
    required this.createdAt,
    this.isCompleted = false,
    this.focusSeconds = 0,
  });

  final String id;
  final String title;
  final bool isCompleted;

  /// Accumulated focus time (in seconds) spent on this todo's timer session.
  final int focusSeconds;
  final DateTime createdAt;

  Todo copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    int? focusSeconds,
    DateTime? createdAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      focusSeconds: focusSeconds ?? this.focusSeconds,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, title, isCompleted, focusSeconds, createdAt];
}