import 'package:crick_cup/constants/app_colors.dart';
import 'package:crick_cup/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColors.offWhite,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          TextField(
            maxLines: 1,
            style: TextStyle(
                fontSize: 18,
                color: AppColors.darkGrey.v900,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              labelText: "Email Address",
              labelStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGrey.v900,
                  fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.0, color: AppColors.darkGrey.v900),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            maxLines: 1,
            style: TextStyle(
                fontSize: 18,
                color: AppColors.darkGrey.v900,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGrey.v900,
                  fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.0, color: AppColors.darkGrey.v900),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            value: isChecked,
            selected: isChecked,
            activeColor: Colors.green,
            checkColor: Colors.white,
            tileColor: Colors.green,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
            title: Text(
              "Remember me and keep me logged in",
              style: TextStyle(color: AppColors.darkGrey.v200, fontSize: 16),
            ),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.primaryColors.oliveGreen,
              minimumSize: const Size.fromHeight(50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              side: BorderSide(
                color: AppColors.darkGrey.v0,
                width: 1,
              ),
            ),
            child: Text(
              "Sign In".toUpperCase(),
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColors.offWhite,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ).paddingSymmetric(
        horizontal: 15,
      ),
    );
  }
}
