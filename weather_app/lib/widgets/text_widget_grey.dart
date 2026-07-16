import 'package:flutter/material.dart';

class TextWidgetGrey extends StatelessWidget {
  const TextWidgetGrey({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, color: Colors.grey),
    );
  }
}