import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold_crowne/constants.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scrollbarTheme: ScrollbarThemeData(
        interactive: true,
        isAlwaysShown: true,
        radius: const Radius.circular(10.0),
        thumbColor: MaterialStateProperty.all(primaryColor),
        thickness: MaterialStateProperty.all(5.0),
        minThumbLength: 10,
      ),
      primaryColor: Color(0xFFFFC700),
      backgroundColor: Color(0xFF000000),
      iconTheme: IconThemeData(color: Colors.black),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Helvetica',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
            fontFamily: 'Helvetica',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 13, horizontal: 45)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        )),
      )),
      primaryIconTheme: IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(color: primaryColor),
      textTheme: TextTheme(
          headline5: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          headline1: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Helvetica'),
          headline3: TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Helvetica'),
          headline4: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Helvetica'),
          subtitle2: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Helvetica'),
          subtitle1: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Helvetica'),
          bodyText2: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Helvetica'),
          button: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontFamily: 'Helvetica')),
    );
  }
}
