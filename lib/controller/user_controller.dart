import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/model/Chat.dart';
import 'package:connect/model/users.dart';
import 'package:connect/services/friendServices.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  RxList<User> users = <User>[].obs;
  var test = ''.obs;
  FriendService friendService = new FriendService();
  List<User> ChatUserList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    fetchChatList();
    super.onInit();
  }

  // fetchChatList() => users(friendService.chatList());

  fetchChatList() {
    ChatUserList = [];
    print('current : ' + users.toString());
    try {
      FirebaseFirestore.instance.collection('Chat').snapshots().listen(
        (QuerySnapshot<Map<String, dynamic>> chatSnapshot) {
          for (QueryDocumentSnapshot<Map<String, dynamic>> chatDoc
              in chatSnapshot.docs) {
            print("Data : " + chatDoc.data().toString());

            if (chatDoc.data()['sen'] == GetStorage().read('EMAIL_ID')) {
              FirebaseFirestore.instance
                  .collection('User')
                  .doc(chatDoc.data()['rec'])
                  .snapshots()
                  .listen((snapshot) {
                if (snapshot.exists) {
                  //======================================================

                  if (-1 ==
                      ChatUserList.indexWhere(
                          (element) => snapshot.id == element.id))
                    ChatUserList.add(User.fromJson(snapshot.data()!));
                  else
                    ChatUserList[ChatUserList.indexWhere(
                            (element) => snapshot.id == element.id)] =
                        User.fromJson(snapshot.data()!);

                  users.assignAll(ChatUserList);

                  //======================================================
                }
              });
            }
          }
        },
      );
      print('done...');
    } catch (e) {
      print("Firebase Service error:" + e.toString());
    }
  }
}
