import 'package:get/get.dart';
import 'package:zero_waste/view/screens/home_screen.dart';


import '../logic/bindings/auth_binding.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/signup_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {

  //initial route
  static const initialRoute = Routes.homeScreen;

  //get pages
  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: Routes.loginScreen, page: () => LoginScreen()),
    GetPage(name: Routes.signUpScreen, page: () => SignUpScreen(),binding: AuthBinding()),

  ];


}

class Routes {

  static const welcomeScreen = "/welcome_screen";
  static const loginScreen = "/login_screen";
  static const signUpScreen = "/signup_screen";
  static const homeScreen = "/home_screen";


}
