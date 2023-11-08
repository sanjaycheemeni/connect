import 'package:connect/view/screen/screen_chat.dart';
import 'package:connect/view/screen/screen_chatlist.dart';
import 'package:connect/view/screen/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main(List<String> args) {
  runApp(GetMaterialApp(
    theme: ThemeData(fontFamily: "ProductSans"),
    home: ChatList(),
  ));
}
