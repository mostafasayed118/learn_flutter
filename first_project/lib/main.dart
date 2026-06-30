import 'package:flutter/material.dart';

void main() {
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Flutter Home Page')),
          backgroundColor: Colors.redAccent,
        ),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 100,
              color: Colors.redAccent,
              child: Center(child: Text('Hello, world!')),
            ),
            Container(
              width: 80,
              height: 100,
              color: Colors.greenAccent,
              child: Center(child: Text('Hello, world!')),
            ),
            Container(
              width: 80,
              height: 100,
              color: Colors.redAccent,
              child: Center(child: Text('Hello, world!')),
            ),
            Container(
              width: 80,
              height: 100,
              color: Colors.yellowAccent,
              child: Center(child: Text('Hello, world!')),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(Icons.add),
        // ),
      ),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
