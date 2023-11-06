import 'package:connect/controller/user_controller.dart';
import 'package:connect/view/widget/Avatar.dart';
import 'package:connect/view/widget/FriendCard.dart';
import 'package:connect/view/widget/chatAvatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatList extends StatelessWidget {
  UserController userController = Get.put(UserController());
  ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFF8D85FF),
          onPressed: () {},
          label: Text('New Connection')),
      backgroundColor: Colors.white,
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
                  style: TextStyle(color: Color(0xFF8D85FF), fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ChatAvatar(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (b, i) => Divider(
                  indent: 10,
                  endIndent: 10,
                  height: .1,
                  thickness: .1,
                  color: Color.fromARGB(255, 136, 136, 136),
                ),
                itemBuilder: (bc, ind) {
                  return ListTile(
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
                    subtitle: Text(userController.users.value[ind].lastMessage),
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
