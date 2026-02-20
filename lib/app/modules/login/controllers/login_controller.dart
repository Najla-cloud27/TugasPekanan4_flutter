import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void login() {
    if (email.value == 'admin@gmail.com' && password.value == '123456') {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Email atau Password salah');
    }
  }
}
