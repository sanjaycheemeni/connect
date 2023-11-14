import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/users.dart' as U;

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
    var usercred = await FirebaseAuth.instance.signInWithCredential(credential);

    CollectionReference users = FirebaseFirestore.instance.collection('User');

    var us = U.User(
        id: usercred.user!.email!,
        timestamp: '0',
        username: usercred.user!.displayName!,
        lastMessage: '',
        verification: false,
        status: 'online');
    users.doc(await usercred.user!.email).set(us.toJson());
    // Once signed in, return the UserCredential
    return await usercred;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
