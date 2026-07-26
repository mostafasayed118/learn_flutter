import 'package:chat_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the sign-in form', (tester) async {
    await tester.pumpWidget(const ChatApp());

    expect(find.text('Welcome to Chat App'), findsOneWidget);
    expect(find.text('Sign in to continue'), findsOneWidget);
    expect(find.text('Email'), findsNWidgets(2));
    expect(find.text('Password'), findsNWidgets(2));
    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);
  });

  testWidgets('validates empty credentials', (tester) async {
    await tester.pumpWidget(const ChatApp());

    await tester.tap(find.text('Sign in'));
    await tester.pump();

    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });
}
