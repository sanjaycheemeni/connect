import 'package:connect/view/widget/Avatar.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      backgroundColor: Colors.white,
      leading: Avatar(),
      title: Text(
        'Sneha',
        style: TextStyle(color: Color(0xFF8D85FF)),
      ),
    );
  }
}
