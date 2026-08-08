import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/update_timer_session.dart';

/// Default length of one focus session (25 minutes).
const int kFocusTargetSeconds = 25 * 60;

sealed class TimerState extends Equatable {
  const TimerState({this.todoId});

  final String? todoId;

  @override
  List<Object?> get props => [todoId];
}

class TimerIdle extends TimerState {
  const TimerIdle({super.todoId});
}

class TimerRunning extends TimerState {
  const TimerRunning({required super.todoId, required this.elapsedSeconds});

  final int elapsedSeconds;

  @override
  List<Object?> get props => [todoId, elapsedSeconds];
}

class TimerPaused extends TimerState {
  const TimerPaused({required super.todoId, required this.elapsedSeconds});

  final int elapsedSeconds;

  @override
  List<Object?> get props => [todoId, elapsedSeconds];
}

/// Drives a focus session timer with 1-second local ticks.
/// Elapsed time is persisted to the todo via [UpdateTimerSession]
/// on pause and on complete — never per tick.
class TimerCubit extends Cubit<TimerState> {
  TimerCubit({required this._updateTimerSession})
      : super(const TimerIdle());

  final UpdateTimerSession _updateTimerSession;

  Timer? _ticker;
  int _elapsedSeconds = 0;
  String? _activeTodoId;

  bool get isRunning => state is TimerRunning;
  bool get isPaused => state is TimerPaused;

  /// Starts (or restarts) a session for [todoId] at zero.
  void start(String todoId) {
    _activeTodoId = todoId;
    _elapsedSeconds = 0;
    _cancelTicker();
    emit(TimerRunning(todoId: _activeTodoId!, elapsedSeconds: 0));
    _ticker = Timer.periodic(const Duration(seconds: 1), tick);
  }

  /// One-second tick. Auto-completes when the target is reached.
  void tick([Timer? _]) {
    final todoId = _activeTodoId;
    if (todoId == null) return;

    if (_elapsedSeconds >= kFocusTargetSeconds) {
      _cancelTicker();
      emit(TimerIdle(todoId: todoId));
      unawaited(_persist(todoId, _elapsedSeconds));
      _elapsedSeconds = 0;
      return;
    }

    _elapsedSeconds++;
    emit(TimerRunning(todoId: todoId, elapsedSeconds: _elapsedSeconds));
  }

  Future<void> pause() async {
    final todoId = _activeTodoId;
    if (todoId == null || !isRunning) return;

    _cancelTicker();
    emit(TimerPaused(todoId: todoId, elapsedSeconds: _elapsedSeconds));
    await _persist(todoId, _elapsedSeconds);
  }

  void resume() {
    final todoId = _activeTodoId;
    if (todoId == null || !isPaused) return;

    _ticker = Timer.periodic(const Duration(seconds: 1), tick);
    emit(TimerRunning(todoId: todoId, elapsedSeconds: _elapsedSeconds));
  }

  Future<void> complete() async {
    final todoId = _activeTodoId;
    if (todoId == null) return;

    _cancelTicker();
    await _persist(todoId, _elapsedSeconds);
    emit(TimerIdle(todoId: todoId));
    _elapsedSeconds = 0;
  }

  /// Resets elapsed time but keeps the todo attached so a new session
  /// can be started immediately.
  void reset() {
    _cancelTicker();
    _elapsedSeconds = 0;
    emit(TimerIdle(todoId: _activeTodoId));
  }

  Future<void> _persist(String todoId, int seconds) async {
    if (seconds > 0) {
      await _updateTimerSession(todoId, seconds);
    }
  }

  void _cancelTicker() {
    _ticker?.cancel();
    _ticker = null;
  }

  @override
  Future<void> close() async {
    _cancelTicker();
    await super.close();
  }
}