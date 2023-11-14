import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/controller/AuthController.dart';
import 'package:connect/view/screen/screen_chat.dart';
import 'package:connect/view/screen/screen_chatlist.dart';
import 'package:connect/view/screen/screen_login.dart';
import 'package:connect/view/screen/screen_users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main(List<String> args) async {
  GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print(GetStorage().read('EMAIL_ID'));
  runApp(GetMaterialApp(
    theme: ThemeData(fontFamily: "ProductSans"),
    // home: UsersPage(),
    home: (AuthController().isLogged.value) ? ChatList() : LoginPage(),
  ));
}
