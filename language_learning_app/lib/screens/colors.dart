import 'package:flutter/material.dart';
import 'package:language_learning_app/components/icon_button.dart';
import 'package:language_learning_app/components/item_list.dart';
import 'package:language_learning_app/models/DataModel.dart';

class ColorsScreen extends StatelessWidget {
  ColorsScreen({super.key});
  final List<DataModel> colors = [
    DataModel(
      imageAsset: 'assets/images/colors/color_black.png',
      label: 'Black',
      translation: 'kuro',
      soundAsset: 'sounds/colors/black.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/colors/color_brown.png',
      label: 'Brown',
      translation: 'chairo',
      soundAsset: 'sounds/colors/brown.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/colors/color_dusty_yellow.png',
      label: 'Dusty Yellow',
      translation: 'hokkaido',
      soundAsset: 'sounds/colors/dusty yellow.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/colors/color_gray.png',
      label: 'Gray',
      translation: 'haiiro',
      soundAsset: 'sounds/colors/gray.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/colors/color_green.png',
      label: 'Green',
      translation: 'midori',
      soundAsset: 'sounds/colors/green.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/colors/color_red.png',
      label: 'Red',
      translation: 'aka',
      soundAsset: 'sounds/colors/red.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/colors/color_white.png',
      label: 'White',
      translation: 'shiro',
      soundAsset: 'sounds/colors/white.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/colors/yellow.png',
      label: 'Yellow',
      translation: 'kiiro',
      soundAsset: 'sounds/colors/yellow.wav',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: Icons.arrow_back,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0xFF46322B),
        title: const Text('Colors', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return ItemList.ItemList(
            item: colors[index],
            backgroundColor: const Color(0xff79359f),
          );
        },
      ),
    );
  }
}
