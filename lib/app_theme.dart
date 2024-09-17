import 'package:flutter/material.dart';

class AppTheme {
  static const Color gold = Color(0xFFFFA90A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFC6C6C6);
  static const Color lava = Color(0xFF707070);
  static const Color graySecond = Color(0xFF282A28);
  static const Color black = Color(0xFF000000);

  static ThemeData lightetheme = ThemeData(
    primaryColor: white,
    scaffoldBackgroundColor: black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1A1A),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1A1A1A),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: gold,
      unselectedItemColor: gray,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: white,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: gray,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      
    ),
  );
}
