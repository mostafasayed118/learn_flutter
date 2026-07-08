import 'package:flutter/material.dart';
import 'package:tunes_layer_app/components/tune_item.dart';
import 'package:tunes_layer_app/models/tune_model.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Flutter Tunes Layer App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
        ),
        body: Column(
          children: tunes.map((tune) => TuneItemContainer(tune: tune)).toList(),
        ),
      ),
    );
  }
}
