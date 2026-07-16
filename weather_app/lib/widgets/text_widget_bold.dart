import 'package:flutter/material.dart';

class TextWidgetBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const TextWidgetBold({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
} 
