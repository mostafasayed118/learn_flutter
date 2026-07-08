import 'package:flutter/material.dart';

class TuneModel {
  final String title;
  final String audioAsset;
  final Color color;

  TuneModel({required this.title, required this.audioAsset, required this.color});
}

final List<TuneModel> tunes = [
  TuneModel(title: 'Note 1', audioAsset: 'note1.wav', color: Colors.blue),
  TuneModel(title: 'Note 2', audioAsset: 'note2.wav', color: Colors.red),
  TuneModel(title: 'Note 3', audioAsset: 'note3.wav', color: Colors.green),
  TuneModel(title: 'Note 4', audioAsset: 'note4.wav', color: Colors.orange),
  TuneModel(title: 'Note 5', audioAsset: 'note5.wav', color: Colors.purple),
  TuneModel(title: 'Note 6', audioAsset: 'note6.wav', color: Colors.cyan),
  TuneModel(title: 'Note 7', audioAsset: 'note7.wav', color: Colors.amber),
];
  