import 'package:flutter/material.dart';
import 'package:tunes_layer_app/components/custome_contener.dart';
import 'package:tunes_layer_app/models/tune_model.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Tunes Layer App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: tunes.length,
          itemBuilder: (context, index) {
            final tune = tunes[index];
            return CustomContainer(tune: tune);
          },
        ),
      ),
    );
  }
}
