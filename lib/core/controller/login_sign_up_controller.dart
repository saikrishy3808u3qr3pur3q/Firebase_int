import 'package:get/get.dart';

import '../service/login_sign_up_service.dart';

class LoginSignUpController extends GetxController {
  final LoginSignUpService _loginSignUpService = LoginSignUpService();

  Future<String> signUpUser({
    required String? name,
    required String? email,
    required String? password,
    required String? photoURL,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email!.isNotEmpty ||
          name!.isNotEmpty ||
          password!.isNotEmpty ||
          photoURL!.isNotEmpty) {
        result = await _loginSignUpService.signUpUser(
          name: name!,
          email: email,
          password: password!,
          photoURL: photoURL!,
        );
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        result = await _loginSignUpService.loginUser(
          email: email,
          password: password,
        );
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<void> logOut() async {
    try {
      await _loginSignUpService.logOut();
    } catch (e) {
      print(e);
    }
  }
}
