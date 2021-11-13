import 'package:flutter/material.dart';
import 'package:gold_crowne/constants.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          isAlwaysShown: true,
          radius: const Radius.circular(10.0),
          thumbColor: MaterialStateProperty.all(primaryColor),
          thickness: MaterialStateProperty.all(5.0),
          minThumbLength: 10,
        ),
        // primaryColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Helvetica',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            primary: Color.fromRGBO(255, 199, 0, 10),
          ),
        ),
        primaryIconTheme: IconThemeData(color: Colors.black),
        buttonColor: Color.fromRGBO(255, 199, 0, 10),

        //3
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
            headline2: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Helvetica'),
            headline3: TextStyle(
                color: primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica'),
            headline4: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Helvetica'),
            subtitle2: TextStyle(
                color: Colors.white, fontSize: 12, fontFamily: 'Helvetica'),
            subtitle1: TextStyle(
                color: Colors.white, fontSize: 12, fontFamily: 'Helvetica'),
            bodyText2: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica'),
            button: TextStyle(
                fontSize: 23,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica')),
        buttonTheme: ButtonThemeData(
            // 4

            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(25.0)),
            colorScheme:
                ColorScheme.light(primary: Color.fromRGBO(255, 199, 0, 10)),
            buttonColor: Color.fromRGBO(255, 199, 0, 10)));
  }
}
