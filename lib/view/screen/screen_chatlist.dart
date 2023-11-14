import 'package:connect/controller/user_controller.dart';
import 'package:connect/view/screen/screen_chat.dart';
import 'package:connect/view/screen/screen_users.dart';
import 'package:connect/view/widget/Avatar.dart';
import 'package:connect/view/widget/FriendCard.dart';
import 'package:connect/view/widget/chatAvatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChatList extends StatelessWidget {
  UserController userController = Get.put(UserController());

  ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    print('VAl => ' + GetStorage().read('IS_LOGGED_IN'));
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFF2434C5),
          onPressed: () {
            Get.to(UsersPage());
          },
          label: Text('New Connection')),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chats',
                  style: TextStyle(color: Color(0xFF2434C5), fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ChatAvatar(),
                )
              ],
            ),
          ),
          // Obx(() => Text(userController.test.value)),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => Expanded(
              child: ListView.separated(
                separatorBuilder: (b, i) => Divider(
                  indent: 10,
                  endIndent: 10,
                  height: .1,
                  thickness: .1,
                  color: Color.fromARGB(255, 136, 136, 136),
                ),
                itemBuilder: (bc, ind) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(ChatPage(
                          receiverUser: userController.users.value[ind].id));
                    },
                    child: ListTile(
                        leading: Avatar(),
                        title: Row(
                          children: [
                            Text(userController.users.value[ind].username),
                            userController.users.value[ind].verification
                                ? Icon(
                                    Icons.verified,
                                    size: 15,
                                    color: Colors.blue,
                                  )
                                : SizedBox()
                          ],
                        ),
                        subtitle:
                            Text(userController.users.value[ind].lastMessage),
                        trailing:
                            (userController.users.value[ind].status == 'online')
                                ? Text(
                                    'online',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text('')),
                  );
                },
                itemCount: userController.users.value.length,
              ),
            ),
          )
        ],
      )),
    );
  }
}
