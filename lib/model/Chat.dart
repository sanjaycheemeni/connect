import 'dart:convert';

import 'package:connect/model/users.dart';

class Chat {
  String id;
  String sender;
  String receiver;

  Chat({
    required this.id,
    required this.sender,
    required this.receiver,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      sender: json['sender'],
      receiver: json['receiver'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'receiver': receiver,
    };
  }
}
