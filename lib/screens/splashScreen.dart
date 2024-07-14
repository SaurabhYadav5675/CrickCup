import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_gadget/constants/app_colors.dart';
import 'package:my_gadget/constants/app_svg.dart';
import 'package:my_gadget/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary().olivGree,
      body: Center(
        child: SvgPicture.asset(AppSvg.loader),
      ),
    );
  }
}
