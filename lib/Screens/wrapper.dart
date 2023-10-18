import 'package:basics_firebase/Screens/Home/home.dart';
import 'package:basics_firebase/Screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // return home or auth
    return Authenticate();
  }
}
