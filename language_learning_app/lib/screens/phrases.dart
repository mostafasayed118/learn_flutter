import 'package:flutter/material.dart';
import 'package:language_learning_app/components/icon_button.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

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
        backgroundColor: Color(0xff50adc7),
        title: const Text('Phrases', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(child: Text('Phrases Screen')),
    );
  }
}
