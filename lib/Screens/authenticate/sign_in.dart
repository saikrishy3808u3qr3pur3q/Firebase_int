import 'package:basics_firebase/services/auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Sign In",
        style: TextStyle(
            color: Colors.black,
        ),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: ElevatedButton(
          style:ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          child: Text("Sign In",
            style: TextStyle(
            color: Colors.black,
          )
          ),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if(result==null){
              print("errrrr");
            }
            else{
              print("u are in");
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
