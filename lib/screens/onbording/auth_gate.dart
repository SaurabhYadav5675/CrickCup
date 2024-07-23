import 'dart:math';

import 'package:crick_cup/extensions/widget_extension.dart';
import 'package:crick_cup/screens/onbording/sign_up.dart';
import 'package:crick_cup/screens/onbording/sing_in.dart';
import 'package:flutter/material.dart';
import 'package:crick_cup/constants/app_colors.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  int selectedIndex = 0;

  updateAuthType(int index) {
    if (index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColors.oliveGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(
                  Icons.bookmarks_sharp,
                  size: 18,
                  color: AppColors.primaryColors.offWhite,
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: selectedIndex == 0
                                  ? AppColors.primaryColors.offWhite
                                  : Colors.transparent))),
                  child: InkWell(
                    onTap: () => updateAuthType(0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColors.offWhite,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: selectedIndex == 1
                                    ? AppColors.primaryColors.offWhite
                                    : Colors.transparent))),
                    child: InkWell(
                      onTap: () => updateAuthType(1),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryColors.offWhite),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 50),
          Text(
            selectedIndex == 0 ? "Welcome back," : "Hey, get on board",
            style: TextStyle(
                fontSize: 28, color: AppColors.primaryColors.offWhite),
          ).paddingSymmetric(horizontal: 15),
          const SizedBox(
            height: 10,
          ),
          Text(
            selectedIndex == 0 ? "Sign in to continue" : "Sign up to continue",
            style: TextStyle(
                fontSize: 16, color: AppColors.primaryColors.offWhite),
          ).paddingSymmetric(horizontal: 15),
          const SizedBox(
            height: 50,
          ),
          Expanded(
              child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: __transitionBuilder,
            child: selectedIndex == 0 ? const SignIn() : const SignUp(),
          )),
        ],
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateWidget = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateWidget,
      child: widget,
      builder: (context, widget) {
        final isUnder = selectedIndex != 0;
        final value =
            isUnder ? min(rotateWidget.value, pi / 2) : rotateWidget.value;
        return Transform(
          transform: Matrix4.rotationY(value),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
