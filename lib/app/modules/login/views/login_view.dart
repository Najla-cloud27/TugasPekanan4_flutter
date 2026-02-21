import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  final AuthController authC = Get.put(AuthController());

  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  EMAIL
            TextField(
              controller: emailC,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            //  PASSWORD
            TextField(
              controller: passC,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            //  LOGIN BUTTON
            ElevatedButton(
              onPressed: () {
                authC.login(emailC.text.trim(), passC.text.trim());
              },
              child: Text("Login"),
            ),

            SizedBox(height: 10),

            //  RESEND EMAIL
            TextButton(
              onPressed: () {
                authC.resendVerification();
              },
              child: Text("Kirim ulang email verifikasi"),
            ),

            //  PINDAH KE SIGNUP
            TextButton(
              onPressed: () => Get.toNamed('/signup'),
              child: Text("Belum punya akun? Signup"),
            ),
          ],
        ),
      ),
    );
  }
}
