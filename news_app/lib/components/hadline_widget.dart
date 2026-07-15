import 'package:flutter/material.dart';

class headline_widget extends StatelessWidget {
  const headline_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'News',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          'Claude',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
