import 'package:crick_cup/constants/app_colors.dart';
import 'package:crick_cup/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hey, get on board",
          style:
              TextStyle(fontSize: 28, color: AppColors.primaryColors.offWhite),
        ).paddingSymmetric(horizontal: 15),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Sign up to continue",
          style:
              TextStyle(fontSize: 16, color: AppColors.primaryColors.offWhite),
        ).paddingSymmetric(horizontal: 15),
        const SizedBox(
          height: 30,
        ),
        Expanded(
            child: Container(
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
              )
            ],
          ).paddingSymmetric(
            horizontal: 15,
          ),
        ))
      ],
    );
  }
}
