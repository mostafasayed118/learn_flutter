import 'package:flutter/material.dart';
import 'package:language_learning_app/components/icon_button.dart';
import 'package:language_learning_app/components/phrase_item.dart';
import 'package:language_learning_app/models/DataModel.dart';

class PhrasesScreen extends StatelessWidget {
  PhrasesScreen({super.key});
  final List<DataModel> phrases = [
    DataModel(
      label: 'are you coming?',
      translation: 'mo chi ka desu',
      soundAsset: 'sounds/phrases/are_you_coming.wav',
    ),
    DataModel(
      label: 'don\'t forget to subscribe',
      translation: 'subusukuri-bu wasurezu ni',
      soundAsset: 'sounds/phrases/dont_forget_to_subscribe.wav',
    ),
    DataModel(
      label: 'how are you feeling?',
      translation: 'anata wa dou kanjiteimasu ka',
      soundAsset: 'sounds/phrases/how_are_you_feeling.wav',
    ),
    DataModel(
      label: 'i\'m love animal sounds',
      translation: 'doubutsu no oto ga daisuki desu',
      soundAsset: 'sounds/phrases/i_love_anime.wav',
    ),
    DataModel(
      label: 'i love programming',
      translation: 'programming no oto ga daisuki desu',
      soundAsset: 'sounds/phrases/i_love_programming.wav',
    ),
    DataModel(
      label: 'what is your name?',
      translation: 'anata no nani desu ka',
      soundAsset: 'sounds/phrases/what_is_your_name.wav',
    ),
    DataModel(
      label: 'where are you going?',
      translation: 'anata wa doko ni ikimasu ka',
      soundAsset: 'sounds/phrases/where_are_you_going.wav',
    ),
    DataModel(
      label: 'yes, I\'m coming',
      translation: 'hachi',
      soundAsset: 'sounds/phrases/yes_im_coming.wav',
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
        title: const Text('Phrases', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return PhraseItem(item: phrases[index]);
        },
      ),
    );
  }
}
