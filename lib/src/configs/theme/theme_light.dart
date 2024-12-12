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
      bottomSheetTheme: bottomSheetTheme);
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

  // Add your Bottom Sheet Theme here
  static BottomSheetThemeData bottomSheetTheme = const BottomSheetThemeData(
    backgroundColor: AppColors.whiteSccafold, // Background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
    ),
    elevation: 8.0, // Shadow effect
    modalElevation: 8.0,
    
    modalBackgroundColor: AppColors.whiteSccafold,
  );
}
