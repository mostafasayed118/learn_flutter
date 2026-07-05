import 'package:flutter/material.dart';
import 'package:language_learning_app/components/icon_button.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

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
        backgroundColor: Color(0xff79359f),
        title: const Text('Colors', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(child: Text('Colors Screen')),
    );
  }
}
