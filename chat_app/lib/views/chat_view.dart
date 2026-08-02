import 'package:chat_app/core/app_assets.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  static String routeName = '/chat_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo, height: 40),
            const Text(
              'Chat View',
              style: TextStyle(color: AppColors.KOnPrimary),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: AppColors.KPrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const ChatBuble();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomFormTextField(
                    hintText: 'Type a message',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
