import 'package:flutter/material.dart';

class ChatInputBar extends StatelessWidget {
  final ontap;
  final controller;
  final marginOfContext;

  const ChatInputBar(
      {super.key,
      required this.ontap,
      required this.controller,
      required this.marginOfContext});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      padding: EdgeInsets.all(7.0),
      height: 70,
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 255, 255, 255),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Type message..',
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 163, 163, 163)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(40.0),
              ),
              fillColor: Color.fromARGB(255, 223, 223, 223),
              filled: true,
            ),
          )),
          SizedBox(width: 20.0),
          Material(
            color: Color(0xFF8D85FF),
            borderRadius: BorderRadius.circular(50.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: ontap,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
