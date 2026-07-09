import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('News'),
            Text('Claude', style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
    );
  }
}
