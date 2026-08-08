import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../shared/extensions/formatters.dart';
import '../cubits/timer_cubit.dart';

/// Animated MM:SS readout with play / pause / reset controls.
class TimerDisplay extends StatelessWidget {
  const TimerDisplay({super.key, required this.todoTitle});

  final String todoTitle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        final isRunning = state is TimerRunning;
        final isPaused = state is TimerPaused;
        final elapsed = switch (state) {
          TimerIdle() => 0,
          TimerRunning(:final elapsedSeconds) => elapsedSeconds,
          TimerPaused(:final elapsedSeconds) => elapsedSeconds,
        };

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              todoTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            Text(
              formatTimer(elapsed),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  tooltip: isRunning
                      ? 'Pause'
                      : isPaused
                          ? 'Resume'
                          : 'Start',
                  onPressed: () {
                    final cubit = context.read<TimerCubit>();
                    if (isRunning) {
                      cubit.pause();
                    } else if (isPaused) {
                      cubit.resume();
                    }
                  },
                  icon: Icon(isRunning ? LucideIcons.pause : LucideIcons.play),
                ),
                const SizedBox(width: 16),
                IconButton(
                  tooltip: 'Reset',
                  onPressed: () => context.read<TimerCubit>().reset(),
                  icon: const Icon(LucideIcons.rotateCcw),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}