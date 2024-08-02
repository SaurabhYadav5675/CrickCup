import 'package:crick_cup/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: AppColors.primaryColors.oliveGreen,
  );

  static final dartTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    splashColor: Colors.black,
    useMaterial3: true,
    colorSchemeSeed: AppColors.primaryColors.oliveGreen,
  );
}
