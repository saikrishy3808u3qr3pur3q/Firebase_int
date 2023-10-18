import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/user_model.dart';
import 'package:path/path.dart';

class LoginSignUpService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
    required String photoURL,
  }) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final File? _photo;
      _photo = File(photoURL);

      final fileName = basename(_photo.path);
      final destination = 'files/$fileName';

      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(_photo);

      final String newURL = await ref.getDownloadURL();

      UserModel userModel = UserModel(
        email: email,
        name: name,
        uid: user.user!.uid,
        photoURL: newURL,
      );

      await _firestore.collection('users').doc(user.user!.uid).set(
            userModel.toJson(),
          );

      return 'success';
    } catch (e) {
      throw Exception('error $e');
    }
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      print(email + '  ' + password);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } catch (e) {
      throw Exception('error $e');
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('error during sign-out $e');
    }
  }
}
