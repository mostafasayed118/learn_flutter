import 'package:chat_app/core/app_theme.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/sign_in_view.dart';
import 'package:chat_app/views/sign_up_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignInView.routeName: (context) => SignInView(),
        SignUpView.routeNameSignUp: (context) => SignUpView(),
        ChatView.routeName: (context) => ChatView(),
      },
      initialRoute: SignInView.routeName,
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: AppTheme.light,
    );
  }
}
