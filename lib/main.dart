import 'package:crick_cup/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:crick_cup/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
