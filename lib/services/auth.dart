import 'package:firebase_auth/firebase_auth.dart';
import 'package:basics_firebase/models/user.dart';
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //sign in anon
  Userp? _userpFromFireBaseUser(User user){
    return user != null ? Userp(uid: user.uid) : null;
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userpFromFireBaseUser(user);
    }

    catch (e) {
      return null;
    }
  }

  //sign in with email and password
  //register with email and password
  //signout
}