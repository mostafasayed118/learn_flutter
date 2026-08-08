import 'package:equatable/equatable.dart';

/// Typed application error hierarchy. UI layers switch on these to show
/// user-friendly messages.
sealed class AppError extends Equatable implements Exception {
  const AppError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

/// Raised when a local database (Hive) operation fails.
class DatabaseError extends AppError {
  const DatabaseError(super.message);

  @override
  String toString() => 'DatabaseError: $message';
}

/// Fallback for unexpected errors.
class UnknownError extends AppError {
  const UnknownError([super.message = 'Something went wrong']);

  @override
  String toString() => 'UnknownError: $message';
}

/// Maps any thrown error to a typed [AppError].
AppError appErrorFrom(Object error) =>
    error is AppError ? error : UnknownError(error.toString());