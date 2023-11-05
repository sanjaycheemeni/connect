import 'package:connect/view/widget/Avatar.dart';
import 'package:connect/view/widget/chatAvatar.dart';
import 'package:flutter/material.dart';

class ReceivedMessageBubble extends StatelessWidget {
  final LastMessage;
  final String message;
  final String time;

  ReceivedMessageBubble(
      {required this.message, required this.time, required this.LastMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft, // Right-align the bubble
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 40, left: 10, top: 2),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text(message),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 228, 228),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: LastMessage
                            ? Radius.circular(5)
                            : Radius.circular(15))),
              ),
              LastMessage
                  ? Padding(
                      padding: EdgeInsets.only(top: 1, bottom: 0, left: 15),
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
