import 'dart:convert';

class User {
  final String timestamp;
  final String id;
  final String username;
  final String lastMessage;
  final bool verification;
  final String status;

  User({
    required this.id,
    required this.timestamp,
    required this.username,
    required this.lastMessage,
    required this.verification,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      timestamp: json['timestamp'],
      username: json['name'],
      lastMessage: json['lastMessage'],
      verification: json['verification'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp,
      'name': username,
      'lastMessage': lastMessage,
      'verification': verification,
      'status': status,
    };
  }
}

List<User> chatListFromJson(String data) => List<User>.from(json
    .decode(data)['data']
    .map((x) => User.fromJson(Map<String, dynamic>.from(x))));
