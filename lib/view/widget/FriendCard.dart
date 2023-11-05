import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendCard extends StatelessWidget {
  final String name, image, status, id;
  const FriendCard(
      {super.key,
      required this.name,
      required this.image,
      required this.status,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      width: MediaQuery.of(context).size.width - 80,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.transparent),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          width: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            image,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 240,
          child: Text(
            name,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ]),
    );
  }
}
