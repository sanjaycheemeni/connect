import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    List<Message> msg = [];
    var id = GetStorage().read('EMAIL_ID');
    try {
      FirebaseFirestore.instance.collection('Messages').snapshots().listen(
        (QuerySnapshot<Map<String, dynamic>> chatSnapshot) {
          List<String> usersList = [];
          for (QueryDocumentSnapshot<Map<String, dynamic>> chatDoc
              in chatSnapshot.docs) {
            if ((chatDoc.data()['sender'] == receiverUser &&
                    chatDoc.data()['receiver'] == id) ||
                (chatDoc.data()['sender'] == id &&
                    chatDoc.data()['receiver'] == receiverUser)) {
              print('---------------${chatDoc.data()}----------------');
              msg.add(Message.fromJson(chatDoc.data()));
            }
          }
        },
      );
      print(msg);

      messages.assignAll(msg);
    } catch (e) {
      print("Firebase Service error:" + e.toString());
    }
    print('returning list...${messages.toString()}');
  }

  Future<void> sendMessage() async {
    if (send.text.isNotEmpty) {
      var msg = Message(
          content: send.text.toString(),
          time: DateTime.now().millisecondsSinceEpoch.toString(),
          sender: GetStorage().read('EMAIL_ID'),
          receiver: receiverUser,
          status: 'sent');
      var ou = await ChatService().send(msg);
      print(ou);
      // messages.add(msg);

      scrollController.value.animateTo(
          scrollController.value.position.maxScrollExtent + 50,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn);

      send.clear();
    }
  }
}
