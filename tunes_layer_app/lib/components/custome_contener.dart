import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tunes_layer_app/models/tune_model.dart';

class CustomContainer extends StatelessWidget {
  final TuneModel tune;

  const CustomContainer({super.key, required this.tune});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        AudioPlayer audioPlayer = AudioPlayer();
        await audioPlayer.setSource(AssetSource(tune.audioAsset));
        await audioPlayer.play(AssetSource(tune.audioAsset));
      },
      child: Container(
        height: 99,
        color: tune.color,
        child: Center(
          child: Text(tune.title, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
