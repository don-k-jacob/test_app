import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_app/home/home.dart';
import 'package:test_app/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final FirebaseOptions options = FirebaseOptions(
  //     apiKey: "AIzaSyB3msKq-8QiinjxmUGHncnSvD2YIXvlBRs",
  //     authDomain: "bookstore-b425c.firebaseapp.com",
  //     projectId: "bookstore-b425c",
  //     storageBucket: "bookstore-b425c.appspot.com",
  //     messagingSenderId: "563203228633",
  //     appId: "1:563203228633:web:8fc100f0e6b32f21a60fc8",
  //     measurementId: "G-65ST1W4N9D");
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);  // auth.useEmulator('http://127.0.0.1:9099');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        isLogin = false;
      } else {
        print('User is signed in!');
        isLogin = true;
      }
    });
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: isLogin ? Login() : HomePage(),
    );
  }
}
