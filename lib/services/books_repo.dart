import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/home/home.dart';
import 'package:test_app/model/book_model.dart';

class BookRepo {
  final db = FirebaseFirestore.instance;

  Future<List<BookModel>> getBooks() async {
    final snapshot = await db.collection("books").get();
    final bookdata =
        snapshot.docs.map((e) => BookModel.fromSnapshot(e)).toList();
    return bookdata;
  }
}
