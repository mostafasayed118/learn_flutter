import 'package:chat_app/core/app_theme.dart';
import 'package:chat_app/views/sign_in_view.dart';
import 'package:chat_app/views/sign_up_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ChatApp());

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/sign-in': (context) => const SignInView(),
        '/sign-up': (context) => const SignUpView(),
      },
      initialRoute: '/sign-in',
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: AppTheme.light,
      home: SignInView(),
    );
  }
}
