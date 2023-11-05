import 'dart:convert';

class Message {
  String content;
  String time;
  String sender;
  String receiver;
  String status;

  Message({
    required this.content,
    required this.time,
    required this.sender,
    required this.receiver,
    required this.status,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json['content'],
      time: json['time'],
      sender: json['sender'],
      receiver: json['receiver'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'time': time,
      'sender': sender,
      'receiver': receiver,
      'status': status,
    };
  }
}

List<Message> messagesFromJson(String data) => List<Message>.from(json
    .decode(data)['data']
    .map((x) => Message.fromJson(Map<String, dynamic>.from(x))));
