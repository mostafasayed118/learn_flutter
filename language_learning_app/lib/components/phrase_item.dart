import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:language_learning_app/components/icon_button.dart';
import 'package:language_learning_app/models/DataModel.dart';

class PhraseItem extends StatelessWidget {
  const PhraseItem({required this.item, super.key});
  final DataModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Color(0xff7c3f58),
      child: ListTile(
        title: Text(item.label, style: TextStyle(color: Colors.white)),
        subtitle: Text(item.translation, style: TextStyle(color: Colors.white)),
        trailing: CustomIconButton(icon: Icons.play_arrow, onPressed: () {
          AudioPlayer player = AudioPlayer();
          player.setSourceAsset(item.soundAsset);
          player.play(AssetSource(item.soundAsset));
        }),
      ),
    );
  }
}
