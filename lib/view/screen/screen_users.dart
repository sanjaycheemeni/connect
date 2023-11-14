import 'package:connect/controller/Connection_controller.dart';
import 'package:connect/view/widget/Avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends StatelessWidget {
  ConnectionController connectionController = Get.put(ConnectionController());
  UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Users',
                  style: TextStyle(color: Color(0xFF8D85FF), fontSize: 30),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => Expanded(
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (b, i) {
                    return ListTile(
                      leading: Avatar(),
                      title: Row(
                        children: [
                          Text(connectionController.allUsers.value[i].username),
                          connectionController.allUsers.value[i].verification
                              ? Icon(
                                  Icons.verified,
                                  size: 15,
                                  color: Colors.blue,
                                )
                              : SizedBox()
                        ],
                      ),
                      subtitle: Text(connectionController.allUsers.value[i].id),
                    );
                  },
                  separatorBuilder: (b, i) {
                    return SizedBox();
                  },
                  itemCount: connectionController.allUsers.value.length),
            ),
          ),
          // Obx(() => Text(userController.test.value)),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
