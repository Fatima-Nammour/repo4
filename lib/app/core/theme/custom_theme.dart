import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    fontFamily: 'Almarai',
    buttonTheme: const ButtonThemeData(),
    errorColor: Colors.yellow,
    textTheme: const TextTheme(
      headline4: TextStyle(
        fontSize: 40.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontSize: 30.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontSize: 26.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      button: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontSize: 22.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    errorColor: Colors.yellow,
    fontFamily: 'Almarai',
    textTheme: const TextTheme(
      headline4: TextStyle(
        fontSize: 40.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontSize: 30.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontSize: 26.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      button: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontSize: 22.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
