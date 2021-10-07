import 'package:flutter/material.dart';
import 'package:gold_crowne/constants.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
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
        buttonColor: Color.fromRGBO(255, 199, 0, 10),
  
      
        //3
        textTheme: TextTheme(
          
            headline1: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Helvetica'),
            headline3: TextStyle(
                color: primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
            
                fontFamily: 'Helvetica'),
                subtitle2:  TextStyle(
                color: Colors.white, fontSize: 16, fontFamily: 'Helvetica'),
            subtitle1: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Helvetica'),
            button: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica')),
        buttonTheme: ButtonThemeData(
            // 4
      
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            colorScheme:
                ColorScheme.light(primary: Color.fromRGBO(255, 199, 0, 10)),
            buttonColor: Color.fromRGBO(255, 199, 0, 10)));
  }
}
