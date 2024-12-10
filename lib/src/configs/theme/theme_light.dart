import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';

import 'theme_text.dart';

class Themelight {
  Themelight._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteSccafold,
    appBarTheme: appbarTheme,
    textTheme: Themetext.textTheme,
    useMaterial3: true,
    elevatedButtonTheme: elevatedbuttontheme,
  );
  static AppBarTheme appbarTheme = const AppBarTheme(
      backgroundColor: AppColors.whiteSccafold,
      titleTextStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500));
  static ElevatedButtonThemeData elevatedbuttontheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      minimumSize: const Size(327.0, 56.0),
    ),
  );
}
