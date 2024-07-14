import 'package:flutter/material.dart';
import 'package:my_gadget/constants/app_colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColors().olivGree,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(
                  Icons.bookmarks_sharp,
                  size: 18,
                  color: PrimaryColors().offWhite,
                ),
                const Spacer(),
                Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 16,
                      color: PrimaryColors().offWhite,
                      decorationColor: PrimaryColors().offWhite,
                      decorationThickness: 2,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Sign Up",
                  style:
                      TextStyle(fontSize: 16, color: PrimaryColors().offWhite),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome Back,",
              style: TextStyle(
                fontSize: 20,
                color: PrimaryColors().offWhite,
                decorationColor: PrimaryColors().offWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
