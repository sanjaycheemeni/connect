import 'package:connect/view/widget/Avatar.dart';
import 'package:connect/view/widget/chatAvatar.dart';
import 'package:flutter/material.dart';

class SenderMessageBubble extends StatelessWidget {
  final LastMessage;
  final String message;
  final String time;

  SenderMessageBubble(
      {required this.message, required this.time, required this.LastMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(left: 40, right: 8, top: 2),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Color(0xFF8D85FF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: LastMessage
                            ? Radius.circular(5)
                            : Radius.circular(15))),
              ),
              LastMessage
                  ? Padding(
                      padding: EdgeInsets.only(top: 1, bottom: 1, right: 15),
                      child: Text(
                        time,
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ));
  }
}
