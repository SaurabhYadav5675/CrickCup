import 'dart:async';

import 'package:crick_cup/constants/app_colors.dart';
import 'package:crick_cup/constants/app_svg.dart';
import 'package:crick_cup/extensions/widget_extension.dart';
import 'package:crick_cup/utility/validator.dart';
import 'package:crick_cup/widgets/dialog_box/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisibility = StreamController<bool>.broadcast();
  final isChecked = StreamController<bool>.broadcast();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordVisibility.sink.add(false);
    isChecked.sink.add(false);
    super.initState();
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    passwordVisibility.close();
    isChecked.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primaryColors.offWhite,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              TextFormField(
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
                validator: (value) {
                  return Validator.emailFieldValidator(value);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              StreamBuilder<bool>(
                stream: passwordVisibility.stream,
                builder: (context, value) {
                  bool visibility = value.data ?? false;
                  return TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: !visibility,
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
                        suffixIcon: IconButton(
                          icon: Icon(
                            visibility
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            color: visibility
                                ? AppColors.darkGrey.v500
                                : AppColors.darkGrey.v300,
                            size: 20,
                          ),
                          color: AppColors.primaryColors.oliveGreen,
                          onPressed: () {
                            passwordVisibility.sink.add(!visibility);
                          },
                        ),
                        alignLabelWithHint: false,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.0, color: AppColors.darkGrey.v900),
                        ),
                        errorMaxLines: 2),
                    validator: (value) {
                      return Validator.passwordFieldValidator(value);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (ctx) => const ForgotPassword());
                    },
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: AppColors.orange.v800,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              StreamBuilder<bool>(
                  stream: isChecked.stream,
                  builder: (context, value) {
                    bool isSelected = value.data ?? false;
                    return CheckboxListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      value: isSelected,
                      selected: isSelected,
                      activeColor: AppColors.orange.v800,
                      checkColor: Colors.white,
                      tileColor: AppColors.orange.v800,
                      onChanged: (value) {
                        isChecked.sink.add(!isSelected);
                      },
                      title: Text(
                        "Remember me and keep me logged in",
                        style: TextStyle(
                            color: AppColors.darkGrey.v200, fontSize: 16),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }),
              const SizedBox(
                height: 40,
              ),
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
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
              const SizedBox(
                height: 15,
              ),
              Text(
                "-Or you can also-",
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.darkGrey.v200,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15,
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primaryColors.offWhite,
                  minimumSize: const Size.fromHeight(50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  side: BorderSide(
                    color: AppColors.darkGrey.v100,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AppSvg.googleSvg, height: 28, width: 28),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Sign in with google".toUpperCase(),
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.darkGrey.v600,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ).paddingSymmetric(
            horizontal: 15,
          ),
        ),
      ),
    );
  }
}
