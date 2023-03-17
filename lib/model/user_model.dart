import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String name;
  final String imgUrl;
  final String emailId;

  User({
    required this.name,
    required this.imgUrl,
    required this.emailId,
    required this.id,
  });
  toJson() {
    return {
      "name": name,
      "img_url": imgUrl,
      "email_id": emailId,
    };
  }

  factory User.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return User(
      id: documentSnapshot.id,
      name: data["name"],
      emailId: data["emailId"],
      imgUrl: data["imgUrl"],
    );
  }
}
