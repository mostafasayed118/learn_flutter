import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:language_learning_app/components/icon_button.dart';
import 'package:language_learning_app/models/numbers.dart';

class ItemNumbers extends StatelessWidget {
  const ItemNumbers({
    super.key,
    required this.number,
    required this.backgroundColor,
  });
  final Data number;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 80,
      child: Row(
        children: [
          Container(
            color: Color(0xfffef6db),
            child: Image.asset(number.imageAsset),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number.label,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  number.translation,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CustomIconButton(
              onPressed: () async {
                final player = AudioPlayer();
                await player.setSourceAsset(number.soundAsset);
                await player.play(AssetSource(number.soundAsset));
              },
              icon: Icons.play_arrow,
            ),
          ),
        ],
      ),
    );
  }
}
