import 'package:flutter/material.dart';

class ChatInputBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
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
              fillColor: Color.fromARGB(255, 255, 255, 255),
              filled: true,
            ),
          )),
          SizedBox(width: 8.0),
          Material(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                // Handle the send button press
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
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
