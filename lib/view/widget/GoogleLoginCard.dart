import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/controller/AuthController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleLoginCard extends StatelessWidget {
  final AuthController authController;
  const googleLoginCard({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        authController.googleAuth();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width - 100,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFF8D85FF)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'images/icons_google.png',
            width: 30,
            color: const Color.fromARGB(255, 255, 255, 255),
            height: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            'Login with Google',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
          )
        ]),
      ),
    );
  }
}
