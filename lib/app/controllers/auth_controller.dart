import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // SIGN UP
  Future<void> signup(String email, String password) async {
    try {
      // 1. Membuat akun baru
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // 2. Kirim email verifikasi
      await userCredential.user!.sendEmailVerification();

      // 3. Notifikasi ke user
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Cek email kamu untuk verifikasi akun",
      );

      // 4. Arahkan ke login
      Get.offAllNamed('/login');
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: e.toString());
    }
  }

  //  LOGIN
  Future<void> login(String email, String password) async {
    try {
      // 1. Login user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      // 2. WAJIB reload
      await user!.reload();
      user = _auth.currentUser;

      // 3. Cek verifikasi
      if (user!.emailVerified) {
        Get.offAllNamed('/home');
      } else {
        Get.defaultDialog(
          title: "Email Belum Verifikasi",
          middleText: "Silakan cek email kamu dulu",
        );
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: e.toString());
    }
  }

  //  RESEND
  Future<void> resendVerification() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await user.sendEmailVerification();

        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Email verifikasi dikirim ulang",
        );
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: e.toString());
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }
}
