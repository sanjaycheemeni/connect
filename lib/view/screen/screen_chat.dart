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

  final receiverUser;
  late ChatController chatController;
  ChatPage({super.key, required this.receiverUser}) {
    chatController = Get.put(ChatController(receiverUser: receiverUser));
  }

  @override
  Widget build(BuildContext context) {
    // var sender_id = 'user1@example.com';
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      //
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // appbar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChatAppBar(),
      ),

      // body
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        // physics: RangeMaintainingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                margin: EdgeInsets.only(top: 15),
                color: const Color.fromARGB(255, 255, 255, 255),
                height: _deviceHeight -
                    195 -
                    MediaQuery.of(context).viewInsets.bottom,
                child: Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      reverse: false,
                      controller: chatController.scrollController.value,
                      itemCount: chatController.messages.value.length,
                      itemBuilder: (BuildContext, index) {
                        //  check is LastMessage  or Not
                        var isLastMessage = true;
                        var msgTime = DateTime.fromMillisecondsSinceEpoch(
                            int.parse(
                                chatController.messages.value[index].time));

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
                                .toString() !=
                            receiverUser.toLowerCase().toString()) {
                          return SenderMessageBubble(
                              message:
                                  chatController.messages.value[index].content,
                              time: '${msgTime.hour}:${msgTime.minute}',
                              LastMessage: isLastMessage);
                        }

                        return ReceivedMessageBubble(
                            message:
                                chatController.messages.value[index].content,
                            time: '${msgTime.hour}:${msgTime.minute}',
                            LastMessage: isLastMessage);
                      }),
                )),
            ChatInputBar(
              marginOfContext:
                  0, //MediaQuery.of(context).viewInsets.bottom + 1,
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
      ),
    );
  }
}
