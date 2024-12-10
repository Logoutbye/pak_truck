import 'package:flutter/material.dart';

class Themetext {
  Themetext._();
  static const double smallSize = 12.0;
  static const double mediumeSize = 14.0;
  static const double largeSize = 18.0;
  static const double extraLargeSize = 24.0;

  static TextTheme textTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: extraLargeSize,
      fontWeight: FontWeight.w600,
      // color: Color(0xFF272B3B),
    ),
    bodyMedium: TextStyle(
      fontSize: mediumeSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      // color: Color(0xFF000000),
    ),
    bodySmall: TextStyle(
      fontSize: mediumeSize,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      // color: Color(0xFF000000),
    ),
    displayMedium: TextStyle(
      fontSize: mediumeSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      // color: Color(0x0ffca4ab),
    ),
  );
  static TextStyle dtextstyle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: largeSize,
    fontWeight: FontWeight.w600,
    // color: Color(0xFF000000),
  );
  static TextStyle atextstyle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: mediumeSize,
    fontWeight: FontWeight.w600,
    // color: Color(0xFF000000),
  );
  static TextStyle greyColortextstyle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: mediumeSize,
    fontWeight: FontWeight.w400,
    color: Color(0xFF9E9E9E),
  );
  static TextStyle ctextstyle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: mediumeSize,
    fontWeight: FontWeight.w500,
    color: Color(0xFFFFFFFF),
  );
  static TextStyle etextstyle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: mediumeSize,
    fontWeight: FontWeight.w700,
    color: Color(0xFF000000),
  );
}
