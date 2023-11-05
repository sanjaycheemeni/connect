import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleLoginCard extends StatelessWidget {
  const googleLoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        margin: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width - 100,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 235, 235, 235)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'images/icons_google.png',
            width: 30,
            color: Colors.black,
            height: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            'Login with Google',
            style: TextStyle(color: Colors.black),
          )
        ]),
      ),
    );
  }
}

Future<UserCredential?> signInWithGoogle() async {
  try {
// Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // add user to firestore databse
    var usercred = FirebaseAuth.instance.signInWithCredential(credential);

    // Once signed in, return the UserCredential
    return await usercred;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
