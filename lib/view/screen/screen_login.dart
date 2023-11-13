import 'package:connect/controller/AuthController.dart';
import 'package:connect/view/widget/GoogleLoginCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  AuthController authController = Get.put(AuthController());
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;
    String? imageUrl = '';
    String? user_name = '';
    final bool isLoggedin;

    // if (user?.displayName == null) {
    //   isLoggedin = false;
    // } else {
    //   print(user?.displayName!);
    //   isLoggedin = true;
    //   user_name = user?.displayName;
    //   imageUrl = user?.photoURL;
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //title
            Text(
              '#Connect',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8D85FF)),
            ),
            SizedBox(
              height: 50,
            ),

            googleLoginCard(
              authController: authController,
            )
          ],
        ),
      )),
    );
  }
}
