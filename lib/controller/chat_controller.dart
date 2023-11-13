import 'dart:convert';

import 'package:connect/model/messages.dart';
import 'package:connect/services/chatServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  TextEditingController send = new TextEditingController();
  final scrollController = ScrollController().obs;
  final String receiverUser;

  ChatController({required this.receiverUser});

  @override
  void onInit() {
    getMessages();
    super.onInit();
  }

  Future<void> getMessages() async {
    messages(await ChatService().fetchMessages(receiverUser));
  }

  void sendMessage() {
    if (send.text.isNotEmpty) {
      messages.add(Message(
          content: send.text.toString(),
          time: DateTime.now().millisecondsSinceEpoch.toString(),
          sender: GetStorage().read('EMAIL_ID'),
          receiver: receiverUser,
          status: 'sent'));

      scrollController.value.animateTo(
          scrollController.value.position.maxScrollExtent + 50,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn);

      send.clear();
    }
  }
}
