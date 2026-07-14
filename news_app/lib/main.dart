import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/homepage_screen.dart';

final dio = Dio();

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePageScreen(),
    );
  }
}
