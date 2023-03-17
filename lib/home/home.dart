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

class _HomePageState extends State<HomePage> {
  List<BookModel> books = [];
  @override
  getbooks() async {
    books = await BookRepo().getBooks();
  }

  DateTime dateTime = DateTime.now();

  void initState() {
    getbooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff131212),
      bottomNavigationBar: Container(
          child: Row(
        children: [
          Container(
            width: size.width / 4,
            height: 57,
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          Container(
            width: size.width / 4,
            height: 57,
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          Container(
            width: size.width / 4,
            height: 57,
            child: Icon(
              Icons.library_books,
              color: Colors.white,
            ),
          ),
          Container(
            width: size.width / 4,
            height: 57,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      )),
      body: Container(
        height: size.height - 100,
        padding: EdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(48),
            bottomRight: Radius.circular(48),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              verticalspacer(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  children: [
                    Text(
                      dateTime.day.toString(),
                      style: TextStyle(
                        color: Color(0xff101011),
                        fontSize: 38,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weekDays[dateTime.weekday],
                          style: const TextStyle(
                            color: Color(0xff9B9CA6),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "${month[dateTime.month]} ${dateTime.year}",
                          style: const TextStyle(
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
                          image: DecorationImage(
                              image: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/bookstore-b425c.appspot.com/o/book4.png?alt=media&token=75e1ab64-7824-4e10-af3c-664bb03f7fa4",
                          ))),
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
                    Row(
                      children: [
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
                                    fontSize: 14,
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
              verticalspacer(28),
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48),
                      topRight: Radius.circular(48),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff131212).withOpacity(0.3),
                        blurRadius: 30,
                        offset: Offset(0, -4),
                      ),
                    ]),
                child: Column(children: [
                  verticalspacer(12),
                  Container(
                    width: 30,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xffDCDCDF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  verticalspacer(24),
                  Text(
                    "My books",
                    style: TextStyle(
                      color: Color(0xff0F0F10),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 112,
                    height: 127,
                    child: Stack(
                      children: [Container()],
                    ),
                  )
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
