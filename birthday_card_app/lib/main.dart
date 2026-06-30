import 'package:flutter/material.dart';

void main() {
  runApp(const BirthdayCardApp());
}

class BirthdayCardApp extends StatelessWidget {
  const BirthdayCardApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffD3BCD6),
        // appBar: AppBar(title: const Text('Birthday Card')),
        body: Center(
          child: const Image(
            image: AssetImage('images/birthday_cake.webp'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
