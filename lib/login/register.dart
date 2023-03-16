import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_app/home/home.dart';
import 'package:test_app/login/login.dart';
import 'package:test_app/util.dart';
import 'package:test_app/services/auth_service.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController confirmpass = TextEditingController();

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xff0F0F10),
                    fontSize: 32,
                  ),
                ),
                verticalspacer(42),
                LoginFormField(
                  controller: email,
                  text: "Email",
                ),
                verticalspacer(21),
                LoginFormField(
                  controller: pass,
                  text: "Password",
                ),
                verticalspacer(21),
                LoginFormField(
                  controller: confirmpass,
                  text: "Confirm Password",
                ),
                verticalspacer(13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forget Password?",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        )),
                  ],
                ),
                verticalspacer(77),
                GestureDetector(
                  onTap: () async {
                    if (pass.text == confirmpass.text) {
                      final message = await AuthServices().registration(
                        email: email.text,
                        password: pass.text,
                      );
                      if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Password is not maching"),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff0F0F10),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 13,
                      ),
                      child: Center(
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                verticalspacer(42),
                RichText(
                  text: TextSpan(
                    text: 'Have an account? ',
                    style: TextStyle(color: Color(0xff0F0F10)),
                    children: [
                      TextSpan(
                          text: 'log in',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          )),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class LoginFormField extends StatelessWidget {
  const LoginFormField({
    super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width / 1.5,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            label: Text(text),
            border: OutlineInputBorder(),
            focusColor: Colors.black,
            fillColor: Colors.amber),
      ),
    );
  }
}
