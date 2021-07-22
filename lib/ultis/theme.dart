import 'package:flutter/material.dart';

ThemeData AppTheme(){
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xff005fa3),
    accentColor: Color(0xff004475),
    backgroundColor: Color(0xff367eb3),
    // scaffoldBackgroundColor: Color(0xffa1cff0),
    disabledColor: Color(0xff004475),
    dividerColor: Color(0xff004475),
    indicatorColor: Color(0xff008cf0),
    colorScheme: ColorScheme(
      background: Color(0xffa1cff0), 
      brightness: Brightness.light, 
      error: Color(0xffa1cff0), 
      onBackground: Color(0xffa1cff0), 
      onError: Color(0xffa1cff0), 
      onPrimary: Colors.white, 
      onSecondary: Colors.white, 
      onSurface: Color(0xffa1cff0), 
      primary: Color(0xff004475), 
      primaryVariant: Color(0xffa1cff0),
      secondary: Color(0xff367eb3), 
      secondaryVariant: Color(0xffa1cff0), 
      surface: Color(0xff004475),
    ),
  );
}