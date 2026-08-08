import 'app_error.dart';

/// A lightweight discriminated result used by the domain layer.
/// - [Result.ok] for success values
/// - [Result.err] for [AppError] failures
sealed class Result<T> {
  const Result();

  const factory Result.ok(T value) = Ok<T>;

  const factory Result.err(AppError error) = Err<T>;

  /// True when this result is an [Ok].
  bool get isSuccess => this is Ok<T>;

  /// True when this result is an [Err].
  bool get isFailure => this is Err<T>;

  /// Unwraps the value, throwing if this is an [Err].
  T get requireValue => switch (this) {
        Ok(value: final value) => value,
        Err() => throw StateError('Cannot unwrap an Err result'),
      };

  R fold<R>(R Function(T value) onOk, R Function(AppError error) onErr) =>
      switch (this) {
        Ok(value: final value) => onOk(value),
        Err(error: final error) => onErr(error),
      };
}

class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;

  @override
  String toString() => 'Ok($value)';
}

class Err<T> extends Result<T> {
  const Err(this.error);

  final AppError error;

  @override
  String toString() => 'Err($error)';
}