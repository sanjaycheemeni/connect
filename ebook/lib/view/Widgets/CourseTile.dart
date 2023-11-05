import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  final String title;
  const CourseTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 233, 233, 233),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromARGB(255, 34, 13, 13),
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    );
  }
}
