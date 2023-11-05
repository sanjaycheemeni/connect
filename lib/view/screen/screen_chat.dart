import 'package:connect/controller/chat_controller.dart';
import 'package:connect/view/widget/ChatInputBar.dart';
import 'package:connect/view/widget/RecMessage.dart';
import 'package:connect/view/widget/SenMessage.dart';
import 'package:connect/view/widget/chatAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ChatPage extends StatelessWidget {
  double _deviceHeight = 0;

  ChatController chatController = Get.put(ChatController());

  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sender_id = 'sender1@gmail.com';
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // appbar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChatAppBar(),
      ),

      // body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              height: _deviceHeight - 140,
              child: Obx(
                () => ListView.builder(itemBuilder: (BuildContext, index) {
                  //  check sender
                  if (chatController.messages.value[index].sender ==
                      sender_id) {
                    return SenderMessageBubble(
                        message: chatController.messages.value[index].content,
                        time: chatController.messages.value[index].time,
                        LastMessage: true);
                  }
                }),
              )),
          ChatInputBar(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
