import 'package:connect/controller/chat_controller.dart';
import 'package:connect/model/messages.dart';
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
    var sender_id = 'user1@example.com';
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              height: _deviceHeight - 140,
              child: Obx(
                () => ListView.builder(
                    reverse: false,
                    controller: chatController.scrollController.value,
                    itemCount: chatController.messages.value.length,
                    itemBuilder: (BuildContext, index) {
                      //  check is LastMessage  or Not
                      var isLastMessage = true;
                      try {
                        if (chatController.messages.value[index + 1].sender
                                .toLowerCase()
                                .toString() ==
                            chatController.messages.value[index].sender
                                .toLowerCase()
                                .toString()) {
                          isLastMessage = false;
                        }
                      } catch (e) {
                        isLastMessage = true;
                      }

                      if (chatController.messages.value[index].sender
                              .toLowerCase()
                              .toString() ==
                          sender_id.toLowerCase().toString()) {
                        return SenderMessageBubble(
                            message:
                                chatController.messages.value[index].content,
                            time: chatController.messages.value[index].time,
                            LastMessage: isLastMessage);
                      }

                      return ReceivedMessageBubble(
                          message: chatController.messages.value[index].content,
                          time: chatController.messages.value[index].time,
                          LastMessage: isLastMessage);
                    }),
              )),
          ChatInputBar(
            controller: chatController.send,
            ontap: () {
              chatController.sendMessage();
            },
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
