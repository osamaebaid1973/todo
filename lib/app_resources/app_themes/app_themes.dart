import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/app_resources/app_colors.dart';
import 'package:todo/app_resources/app_themes/light_theme.dart';
import 'package:todo/app_resources/app_themes/dark_theme.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      elevatedButtonTheme: elevatedButtonThemeData,
      scaffoldBackgroundColor: AppColors.lightThemeBackgroundColor,
      appBarTheme: lightAppBarTheme,
      textTheme: lightTextTheme,
      bottomNavigationBarTheme: lightBottomNavigationBarThemeData);

  static ThemeData darkTheme = ThemeData(
      elevatedButtonTheme: elevatedButtonThemeData,
      scaffoldBackgroundColor: AppColors.darkThemeBackgroundColor,
      appBarTheme: darkAppBarTheme,
      textTheme: darkTextTheme,
      bottomNavigationBarTheme: darkBottomNavigationBarThemeData);
}

//elevated button theme data is the same for both light and dark theme
ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        )));
