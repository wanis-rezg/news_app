import 'package:flutter/material.dart';
import 'package:news_app/core/theme/light_color.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: LightColor.primaryColor,
  
        colorScheme: ColorScheme.light(
     
        ),
        scaffoldBackgroundColor: LightColor.backgroundColor,
      
textButtonTheme: TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: LightColor.primaryColor,
  ),
),
elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: LightColor.primaryColor,
    foregroundColor: Color(0xffFFFCFC),
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
  ),
),
bottomNavigationBarTheme: BottomNavigationBarThemeData(
  backgroundColor: LightColor.backgroundColor,
  type: BottomNavigationBarType.fixed,
  selectedItemColor: LightColor.primaryColor,
  unselectedItemColor: Color(0xFF363636),

  selectedLabelStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  unselectedLabelStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  showUnselectedLabels: true
),

inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
    filled: true,
    fillColor: Color(0xFFFFFFFF),
    focusColor: Color(0xFFD1DAD6),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.red, width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xFFD1DAD6), width: 0.5),
    ),
  ),
);