import 'package:flutter/material.dart';

class AppThemeData{
  static ThemeData get lightThemeData {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
          fixedSize: Size.fromWidth(double.maxFinite),
        ),
      ),
    );
  }
}