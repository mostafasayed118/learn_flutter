import 'package:chat_app/core/app_constans.dart';

class Message {
  final String message;
  final String time;
  final String? id; 

  Message({required this.message, required this.time , this.id});
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json[AppConstants.kMessage] as String? ?? '',
      time: json['time'] as String? ?? '',
      id: json['id'] as String?,
    );
  }
}
