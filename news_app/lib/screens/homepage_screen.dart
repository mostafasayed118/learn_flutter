import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            Text('News', style: TextStyle(color: Colors.black)),
            Text('Claude', style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
      body: const Center(child: Text('News Content')),
    );
  }
}
