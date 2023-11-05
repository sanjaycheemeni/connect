import 'package:connect/model/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatService {
  Future<List<Message>> fetchMessages() async {
    WidgetsFlutterBinding.ensureInitialized();
    return messagesFromJson(
        await rootBundle.loadString('assets/messages.json'));
  }
}
