import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<List<UserModel>> fetchAllUsers() async {
  //   try {
  //     final QuerySnapshot usersSnapshot =
  //         await _firestore.collection('users').get();
  //     List<UserModel> users = [];

  //     for (var userDoc in usersSnapshot.docs) {
  //       users.add(UserModel.fromJson(userDoc.data() as Map<String, dynamic>));
  //     }

  //     return users;
  //   } catch (e) {
  //     throw Exception('Error fetching users: $e');
  //   }
  // }

  Future<void> updateUserName(String userId, String newName) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .update({'name': newName});
    } catch (e) {
      throw Exception('Error updating user name: $e');
    }
  }

  Stream<List<UserModel>> listenToUserUpdates() {
    final CollectionReference usersCollection = _firestore.collection('users');

    return usersCollection.snapshots().map((querySnapshot) {
      List<UserModel> users = [];

      for (var userDoc in querySnapshot.docs) {
        users.add(UserModel.fromJson(userDoc.data() as Map<String, dynamic>));
      }

      return users;
    });
  }
}
