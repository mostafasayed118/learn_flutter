import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.color,
  });
  final TextEditingController controller = TextEditingController();
  final String hintText;
  final String labelText;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        print('User submitted: $value');
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        labelText: labelText,
        labelStyle: TextStyle(color: color),
      ),
      controller: controller,
    );
  }
}
