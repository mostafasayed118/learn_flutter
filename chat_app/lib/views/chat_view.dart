import 'package:chat_app/core/app_assets.dart';
import 'package:chat_app/core/app_colors.dart';
import 'package:chat_app/core/app_constans.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  static String routeName = '/chat_view';
  final CollectionReference messages = FirebaseFirestore.instance.collection(
    AppConstants.kMessagesCollection,
  );
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;

    return StreamBuilder<QuerySnapshot>(
      stream: messages
          .orderBy(AppConstants.kCreatedAt, descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }
        if (snapshot.hasData) {
          List<Message> messagesList = snapshot.data!.docs.map((doc) {
            return Message.fromJson(doc.data() as Map<String, dynamic>);
          }).toList();
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
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(message: messagesList[index])
                          : ChatBubleForFriend(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomFormTextField(
                          controller: _controller,
                          hintText: 'Type a message',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              if (_controller.text.isNotEmpty) {
                                messages.add({
                                  AppConstants.kMessage: _controller.text,
                                  AppConstants.kCreatedAt: DateTime.now(),
                                  AppConstants.kId: email,
                                });
                                _controller.clear();
                                _scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeOut,
                                );
                              }
                            },
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
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
