import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  final String? id;
  final String name;
  final String author;
  final String? url;
  final String? description;

  BookModel(
      {this.id,
      required this.name,
      required this.author,
      this.url,
      this.description});
  toJson() {
    return {
      "name": name,
      "author": author,
      "url": url,
      "description": description
    };
  }

  factory BookModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return BookModel(
        id: documentSnapshot.id,
        name: data["name"],
        author: data["author"],
        url: data["url"],
        description: data["description"]);
  }
}
