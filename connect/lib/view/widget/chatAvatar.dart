import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      width: 25,
      height: 35,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/user.png',
          ),
        ),
      ),
    );
  }
}
