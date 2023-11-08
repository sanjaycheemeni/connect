import 'dart:convert';

import 'package:connect/model/messages.dart';
import 'package:connect/services/chatServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  TextEditingController send = new TextEditingController();
  final scrollController = ScrollController().obs;

  @override
  void onInit() {
    getMessages();
    super.onInit();
  }

  Future<void> getMessages() async {
    messages(await ChatService().fetchMessages());
  }

  void sendMessage() {
    messages.add(Message(
        content: send.text.toString(),
        time: '01:01',
        sender: 'user1@example.com',
        receiver: 'receiver1@example.com',
        status: 'seen'));

    scrollController.value.animateTo(
        scrollController.value.position.maxScrollExtent + 50,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn);

    send.clear();
  }
}
