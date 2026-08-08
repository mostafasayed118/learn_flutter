/// Formats a duration (seconds) as `MM:SS`.
String formatTimer(int totalSeconds) {
  final minutes = (totalSeconds / 60).floor();
  final seconds = totalSeconds % 60;
  final mm = minutes.toString().padLeft(2, '0');
  final ss = seconds.toString().padLeft(2, '0');
  return '$mm:$ss';
}