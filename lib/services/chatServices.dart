import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/model/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatService {
  Future<List<Message>> fetchMessages(String receiverUser) async {
    List<Message> messages = [];
    try {
      FirebaseFirestore.instance.collection('Messages').snapshots().listen(
        (QuerySnapshot<Map<String, dynamic>> chatSnapshot) {
          List<String> usersList = [];
          for (QueryDocumentSnapshot<Map<String, dynamic>> chatDoc
              in chatSnapshot.docs) {
            if (chatDoc.data()['sender'] == receiverUser ||
                chatDoc.data()['receiver'] == receiverUser) {
              messages.add(Message.fromJson(chatDoc.data()));
            }
          }
        },
      );
    } catch (e) {
      print("Firebase Service error:" + e.toString());
    }
    print('returning list...${messages.toString()}');
    return messages;
  }

  send(Message msg) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Messages');

    return users.add(msg.toJson());
  }
}
