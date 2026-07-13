import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/homepage_screen.dart';

void main() {
  getNews(); // Call the getNews function to fetch news data
  runApp(const NewsApp());
}

final dio = Dio();
void getNews() async {
  try {
    final response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=228fad43848e4390ae5fa55daf65a447',
    );
    return print(response.data);
  } catch (e) {
    throw Exception('Failed to load news: $e');
  }
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
