import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  // SIGN UP
  void signup(String email, String password) async {
    try {
      isLoading.value = true;

      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.snackbar("Success", "Akun berhasil dibuat");
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // LOGIN
  void login(String email, String password) async {
    try {
      isLoading.value = true;

      await auth.signInWithEmailAndPassword(email: email, password: password);

      Get.snackbar("Success", "Login berhasil");
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // LOGOUT
  void logout() async {
    // untuk keluar akun
    await auth.signOut();
    // balik ke login
    Get.offAllNamed('/login');
  }
}
