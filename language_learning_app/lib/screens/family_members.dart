import 'package:flutter/material.dart';
import 'package:language_learning_app/components/icon_button.dart';
import 'package:language_learning_app/components/item_list.dart';
import 'package:language_learning_app/models/DataModel.dart';

class FamilyMembersScreen extends StatelessWidget {
  FamilyMembersScreen({super.key});
  final List<DataModel> numbers = [
    DataModel(
      imageAsset: 'assets/images/family_members/family_father.png',
      label: 'Father',
      translation: 'chichioya',
      soundAsset: 'sounds/family_members/father.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/family_members/family_daughter.png',
      label: 'Daughter',
      translation: 'musume',
      soundAsset: 'sounds/family_members/daughter.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/family_members/family_grandfather.png',
      label: 'Grandfather',
      translation: 'ojiisan',
      soundAsset: 'sounds/family_members/grand father.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/family_members/family_mother.png',
      label: 'Mother',
      translation: 'hahaoya',
      soundAsset: 'sounds/family_members/mother.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/family_members/family_grandmother.png',
      label: 'Grandmother',
      translation: 'sobo',
      soundAsset: 'sounds/family_members/grand mother.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/family_members/family_older_brother.png',
      label: 'Older Brother',
      translation: 'niisan',
      soundAsset: 'sounds/family_members/older bother.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/family_members/family_older_sister.png',
      label: 'Older Sister',
      translation: 'ane',
      soundAsset: 'sounds/family_members/older sister.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/family_members/family_son.png',
      label: 'Son',
      translation: 'musuko',
      soundAsset: 'sounds/family_members/son.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/family_members/family_younger_brother.png',
      label: 'Younger Brother',
      translation: 'shounen',
      soundAsset: 'sounds/family_members/younger brohter.wav',
    ),
    DataModel(
      imageAsset: 'assets/images/family_members/family_younger_sister.png',
      label: 'Younger Sister',
      translation: 'jijo',
      soundAsset: 'sounds/family_members/younger sister.wav',
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
        backgroundColor: const Color(0xFF46322B),
        title: const Text(
          'Family Members',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return ItemList.ItemList(
            item: numbers[index],
            backgroundColor: const Color(0xff558b37),
          );
        },
      ),
    );
  }
}
