import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_route.dart';
import '../../../core/constant/colors.dart';
import '../../../core/controller/login_sign_up_controller.dart';
import '../../../core/utils/utils.dart';
import '../../../widget/text_field/material_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LoginSignUpController _loginSignUpController =
      Get.find<LoginSignUpController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  bool _isLoading = false;

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      setState(() {
        _isLoading = true;
      });
      String result = await _loginSignUpController.logInUser(
        email: email,
        password: password,
      );
      if (result == 'success') {
        Utils.showSuccessSnackBar(
            'Login Successful', 'Welcome back to the app');
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        Utils.showErrorSnackBar('issue with Login', result);
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Login With Email',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 20.0),
                buildMaterialTextField(
                  controller: emailController,
                  labelText: 'Email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                buildMaterialTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: showPassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password is smaller than 6 digit';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      const AlertDialog(
                        title: Text(
                          'Oops. The module is under development',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        backgroundColor: AppColors.background,
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.buttonBackground,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                  ),
                  child: _isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  "Don't have an account",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.signUpScreen);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
