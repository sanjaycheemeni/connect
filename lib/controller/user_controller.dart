import 'package:connect/model/users.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxList<User> users = <User>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    users.add(User(
        timestamp: 'timestamp',
        username: 'Sanjay',
        emailId: 'emailId',
        lastMessage: 'Hai',
        verification: true,
        status: 'seen'));
    users.add(User(
        timestamp: 'timestamp',
        username: 'Zuck',
        emailId: 'emailId',
        lastMessage: 'Heyyy',
        verification: true,
        status: 'seen'));
    users.add(User(
        timestamp: 'timestamp',
        username: 'Sneha',
        emailId: 'emailId',
        lastMessage: 'Hai',
        verification: false,
        status: 'seen'));
    users.add(User(
        timestamp: 'timestamp',
        username: 'Narendra Modi',
        emailId: 'emailId',
        lastMessage: 'Hai',
        verification: true,
        status: 'seen'));

    super.onInit();
  }
}
