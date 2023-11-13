import 'package:connect/services/socialAuth.dart';
import 'package:connect/view/screen/screen_chatlist.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../view/widget/GoogleLoginCard.dart';

class AuthController extends GetxController {
  // GetStorage storage = GetStorage();
  RxBool isLogged = (GetStorage().read('IS_LOGGED_IN') == 'true').obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    GetStorage.init();

    isLogged(await GetStorage().read('IS_LOGGED_IN') ?? 'false' == 'true');
    print(await GetStorage().read('IS_LOGGED_IN'));
    super.onInit();
  }

  void googleAuth() async {
    var user = await signInWithGoogle();

    print(user);
    if (user != null) {
      isLogged(true);
      await GetStorage().write('IS_LOGGED_IN', 'true');
      await GetStorage().write('EMAIL_ID', user.user!.email);

      print(GetStorage().read('IS_LOGGED_IN'));
      Get.off(ChatList());
    }
  }
}
