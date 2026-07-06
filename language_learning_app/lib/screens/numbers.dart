import 'package:flutter/material.dart';
import 'package:language_learning_app/components/icon_button.dart';
import 'package:language_learning_app/components/item_list.dart';
import 'package:language_learning_app/models/DataModel.dart';

class NumbersScreen extends StatelessWidget {
  NumbersScreen({super.key});

  final List<DataModel> numbers = [
    DataModel(
      imageAsset: 'assets/images/numbers/number_one.png',
      label: 'One',
      translation: 'ichi',
      soundAsset: 'sounds/numbers/number_one_sound.mp3',
    ),
    DataModel(
      imageAsset: 'assets/images/numbers/number_two.png',
      label: 'Two',
      translation: 'ni',
      soundAsset: 'sounds/numbers/number_two_sound.mp3',
    ),
    DataModel(
      imageAsset: 'assets/images/numbers/number_three.png',
      label: 'Three',
      translation: 'san',
      soundAsset: 'sounds/numbers/number_three_sound.mp3',
    ),
    DataModel(
      imageAsset: 'assets/images/numbers/number_four.png',
      label: 'Four',
      translation: 'shi',
      soundAsset: 'sounds/numbers/number_four_sound.mp3',
    ),
    DataModel(
      imageAsset: 'assets/images/numbers/number_five.png',
      label: 'Five',
      translation: 'go',
      soundAsset: 'sounds/numbers/number_five_sound.mp3',
    ),
    DataModel(
      imageAsset: 'assets/images/numbers/number_six.png',
      label: 'Six',
      translation: 'roku',
      soundAsset: 'sounds/numbers/number_six_sound.mp3',
    ),
    DataModel(
      imageAsset: 'assets/images/numbers/number_seven.png',
      label: 'Seven',
      translation: 'nana',
      soundAsset: 'sounds/numbers/number_seven_sound.mp3',
    ),
    DataModel(
      imageAsset: 'assets/images/numbers/number_eight.png',
      label: 'Eight',
      translation: 'hachi',
      soundAsset: 'sounds/numbers/number_eight_sound.mp3',
    ),
    DataModel(
      imageAsset: 'assets/images/numbers/number_nine.png',
      label: 'Nine',
      translation: 'kyuu',
      soundAsset: 'sounds/numbers/number_nine_sound.mp3',
    ),
    DataModel(
      imageAsset: 'assets/images/numbers/number_ten.png',
      label: 'Ten',
      translation: 'juu',
      soundAsset: 'sounds/numbers/number_ten_sound.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF46322B),
        leading: CustomIconButton(
          icon: Icons.arrow_back,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Numbers', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return ItemList.ItemList(
            item: numbers[index],
            backgroundColor: Color(0xFFEF9235),
          );
        },
      ),
    );
  }

  List<Widget> buildNumbersList() {
    return numbers
        .map(
          (number) => ItemList.ItemList(
            item: number,
            backgroundColor: Color(0xFFEF9235),
          ),
        )
        .toList();
  }
}
