import 'dart:convert';

import 'package:connect/model/messages.dart';
import 'package:connect/services/chatServices.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;

  @override
  void onInit() {
    getMessages();
    super.onInit();
  }

  Future<void> getMessages() async {
    messages(await ChatService().fetchMessages());
  }
}
