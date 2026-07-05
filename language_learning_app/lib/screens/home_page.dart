import 'package:flutter/material.dart';
import 'package:language_learning_app/components/catgory_item.dart';
import 'package:language_learning_app/screens/colors.dart';
import 'package:language_learning_app/screens/family_members.dart';
import 'package:language_learning_app/screens/numbers.dart';
import 'package:language_learning_app/screens/phrases.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffef6db),
      appBar: AppBar(
        title: const Text(
          'Language Learning App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff46322b),
      ),
      body: Column(
        children: [
          Category(
            text: 'Numbers',
            color: Color(0xffef9235),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NumbersScreen()),
              );
            },
          ),
          Category(
            text: 'Family Members',
            color: Color(0xff558b37),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FamilyMembersScreen()),
              );
            },
          ),
          Category(
            text: 'Colors',
            color: Color(0xff79359f),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ColorsScreen()),
              );
            },
          ),
          Category(
            text: 'Phrases',
            color: Color(0xff50adc7),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PhrasesScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
