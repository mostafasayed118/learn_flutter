import 'package:flutter/material.dart';
import 'package:tunes_layer_app/models/tune_model.dart';

class TuneItemContainer extends StatelessWidget {
  final TuneModel tune;

  const TuneItemContainer({super.key, required this.tune});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          await tune.playAudio();
        },
        child: Container(
          color: tune.color,
          child: Center(
            child: Text(tune.title, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
