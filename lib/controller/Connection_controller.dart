import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/services/ConnectionServices.dart';
import 'package:get/get.dart';

import '../model/users.dart';

class ConnectionController extends GetxController {
  RxList<User> allUsers = <User>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchUsersList();
    super.onInit();
  }

  void fetchUsersList() async {
    List<User> usrList = [];
    try {
      await FirebaseFirestore.instance
          .collection('User')
          .snapshots()
          .listen((QuerySnapshot<Map<String, dynamic>> chatSnapshot) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in chatSnapshot.docs) {
          if (doc.exists) if (-1 ==
              usrList.indexWhere((element) => doc.id == element.id))
            usrList.add(User.fromJson(doc.data()!));
          else
            usrList[usrList.indexWhere((element) => doc.id == element.id)] =
                User.fromJson(doc.data()!);

          allUsers.assignAll(usrList);

          usrList.add(User.fromJson(doc.data()));
        }
      });
    } catch (e) {}
    print(usrList);
  }
}
