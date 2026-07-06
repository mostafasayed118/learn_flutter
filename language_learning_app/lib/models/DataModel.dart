import 'package:audioplayers/audioplayers.dart';

class DataModel {
  final String? imageAsset;
  final String label;
  final String translation;
  final String soundAsset;

  const DataModel({
     this.imageAsset,
    required this.label,
    required this.translation,
    required this.soundAsset,
  });

  playSound(){
    AudioPlayer player = AudioPlayer();
    player.setSourceAsset(soundAsset);
    player.play(AssetSource(soundAsset));
  }
}
