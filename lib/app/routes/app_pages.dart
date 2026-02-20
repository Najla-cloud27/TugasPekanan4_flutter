import 'package:get/get.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/home/views/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.login, page: () => LoginView()),
    GetPage(name: Routes.signup, page: () => SignupView()),
    GetPage(name: Routes.home, page: () => HomeView()),
  ];
}
