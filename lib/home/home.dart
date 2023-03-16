import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_app/model/book_model.dart';
import 'package:test_app/services/books_repo.dart';
import 'package:test_app/util.dart';
import '';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HomePageState extends State<HomePage> {
  List<BookModel> books = [];
  @override
  void initState() async {
    books = await BookRepo().getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // bottomNavigationBar: Container(
      //   // decoration: ,
      //   height: 500,
      //   child: CustomPaint(
      //     painter: CurvePainter(),
      //   ),
      // ),
      body: SafeArea(
        child: Column(children: [
          verticalspacer(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              children: [
                Text(
                  "20",
                  style: TextStyle(
                    color: Color(0xff101011),
                    fontSize: 38,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thu",
                      style: TextStyle(
                        color: Color(0xff9B9CA6),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Feb 2020",
                      style: TextStyle(
                        color: Color(0xff9B9CA6),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage(""))),
                )
              ],
            ),
          ),
          verticalspacer(31),
          Padding(
            padding: const EdgeInsets.only(
              left: 28,
              right: 19,
            ),
            child: Row(
              children: [
                Text(
                  "New arrivals",
                  style: TextStyle(
                    color: Color(0xff0F0F10),
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Text(
                  "View all ",
                  style: TextStyle(
                    color: Color(0xffF6C12D),
                    fontSize: 13,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xfffF6C12D),
                  size: 24,
                )
              ],
            ),
          ),
          verticalspacer(25),
          Container(
            width: size.width,
            height: 280,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: books.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 12),
                itemBuilder: (BuildContext context, int index) {
                  BookModel book = books[index];
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      height: 257,
                      width: 130,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 197,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Color(0xff211B1B),
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                      image: NetworkImage(book.url ??
                                          "https://firebasestorage.googleapis.com/v0/b/bookstore-b425c.appspot.com/o/book4.png?alt=media&token=75e1ab64-7824-4e10-af3c-664bb03f7fa4"))),
                            ),
                            verticalspacer(18),
                            Text(
                              book.name,
                              style: TextStyle(
                                color: Color(0xff0F0F10),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            verticalspacer(6),
                            Text(
                              book.author,
                              style: TextStyle(
                                color: Color(0xff9D9EA8),
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                              ),
                            ),
                          ]),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
