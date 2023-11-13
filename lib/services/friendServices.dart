import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/model/users.dart';

class FriendService {
  late FirebaseFirestore _firestore;

  FriendService() {
    _firestore = FirebaseFirestore.instance;
  }

  List<User> chatList() {
    List<User> ChatUserList = [];
    try {
      FirebaseFirestore.instance.collection('Chat').snapshots().listen(
        (QuerySnapshot<Map<String, dynamic>> chatSnapshot) {
          List<String> usersList = [];
          for (QueryDocumentSnapshot<Map<String, dynamic>> chatDoc
              in chatSnapshot.docs) {
            // ---------------
            print("******************");

            FirebaseFirestore.instance
                .collection('User')
                .doc(chatDoc.data()['rec'])
                .snapshots()
                .listen((snapshot) {
              if (snapshot.exists) {
                ChatUserList.add(User.fromJson(snapshot.data()!));
                print("**********###********");
              }
            });
          }
        },
      );
    } catch (e) {
      print("Firebase Service error:" + e.toString());
    }
    print('returning list...${ChatUserList.toString()}');
    return ChatUserList;
  }
}
