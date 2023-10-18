class UserModel {
  final String email;
  final String photoURL;
  late final String name;
  final String uid;

  UserModel({
    required this.email,
    required this.name,
    required this.uid,
    required this.photoURL,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "uid": uid,
        "name": name,
        "photoURL": photoURL,
      };

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      photoURL: json['photoURL'],
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
    );
  }
}
