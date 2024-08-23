import 'package:crick_cup/constants/app_colors.dart';
import 'package:crick_cup/utilities/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVerifyOtp = false;

  @override
  void dispose() {
    emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: AppColors.primaryColors.offWhite,
      insetPadding: const EdgeInsets.only(left: 10, right: 10),
      elevation: 5,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.primaryColors.oliveGreen,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Row(
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColors.offWhite,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        size: 22,
                        color: AppColors.primaryColors.offWhite,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                maxLines: 1,
                enabled: !isVerifyOtp,
                style: TextStyle(
                    fontSize: 16,
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
            ),
            const SizedBox(
              height: 25,
            ),
            Visibility(
              visible: !isVerifyOtp,
              replacement: verifyOtp(),
              child: OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isVerifyOtp = !isVerifyOtp;
                    });
                  }
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primaryColors.oliveGreen,
                  minimumSize: const Size(80, 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  side: BorderSide(
                    color: AppColors.darkGrey.v0,
                    width: 1,
                  ),
                ),
                child: Text(
                  "Get Otp",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryColors.offWhite,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget verifyOtp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 4,
            child: SizedBox(
              height: 45,
              child: TextFormField(
                maxLines: 1,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.darkGrey.v900,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  labelText: "Otp",
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
                  return Validator.otpFieldValidator(value, 4);
                },
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          OutlinedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context);
              }
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.primaryColors.oliveGreen,
              minimumSize: const Size(100, 45),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              side: BorderSide(
                color: AppColors.darkGrey.v0,
                width: 1,
              ),
            ),
            child: Text(
              "Verify",
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColors.offWhite,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
