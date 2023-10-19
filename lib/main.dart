import 'package:basics_firebase/core/constant/app_route.dart';
import 'package:basics_firebase/view/home_screen/home_screen.dart';
import 'package:basics_firebase/view/login_signup/login/login.dart';
import 'package:basics_firebase/view/login_signup/signup/signup.dart';
import 'package:basics_firebase/view/screens/settings_screen.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/controller/login_sign_up_controller.dart';
import 'view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(LoginSignUpController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Login SignUp',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.loginScreen: (context) => const LoginScreen(),
        AppRoutes.homeScreen: (context) => HomeScreen(),
        AppRoutes.signUpScreen: (context) => const SignUpScreen(),
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        '/settings':(context)=> const SettingsScreen()
      },
      initialRoute: AppRoutes.splashScreen,
    );
  }
}
