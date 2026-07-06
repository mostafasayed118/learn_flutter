import 'package:flutter/material.dart';
import 'package:language_learning_app/components/icon_button.dart';
import 'package:language_learning_app/components/phrase_item.dart';
import 'package:language_learning_app/models/DataModel.dart';

class ItemList extends StatelessWidget {
  const ItemList.ItemList({
    super.key,
    required this.item,
    required this.backgroundColor,
  });
  final DataModel item;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 80,
      child: Row(
        children: [
          item.imageAsset == null
              ? PhraseItem(item: item)
              : Container(
                  color: Color(0xfffef6db),
                  child: Image.asset(item.imageAsset!),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  item.translation,
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
                item.playSound();
              },
              icon: Icons.play_arrow,
            ),
          ),
        ],
      ),
    );
  }
}
