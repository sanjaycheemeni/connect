import 'package:connect/services/socialAuth.dart';
import 'package:get/get.dart';

import '../view/widget/GoogleLoginCard.dart';

class AuthController extends GetxController {
  Future<bool> googleAuth() async {
    var user = await signInWithGoogle();
    if (user != null) {
      return true;
    }
    return false;
  }
}
