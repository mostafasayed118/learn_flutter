import 'package:flutter_test/flutter_test.dart';

import 'package:simple_todo_timer_app/shared/extensions/formatters.dart';

void main() {
  group('formatTimer', () {
    test('formats zero as MM:SS', () {
      expect(formatTimer(0), '00:00');
    });

    test('pads single digits', () {
      expect(formatTimer(5), '00:05');
      expect(formatTimer(65), '01:05');
    });

    test('rolls over past 60 minutes', () {
      expect(formatTimer(3600), '60:00');
      expect(formatTimer(3661), '61:01');
    });
  });
}