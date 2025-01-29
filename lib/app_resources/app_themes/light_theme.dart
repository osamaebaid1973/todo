import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/app_resources/app_colors.dart';

AppBarTheme lightAppBarTheme = const AppBarTheme(
    color: AppColors.lightThemeBackgroundColor,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.primaryColor));

BottomNavigationBarThemeData lightBottomNavigationBarThemeData =
    const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white);

TextTheme lightTextTheme = TextTheme(
  titleMedium: GoogleFonts.inter(
      fontSize: 20, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
  bodySmall: GoogleFonts.inter(
      fontSize: 16,
      color: AppColors.lightThemeTextColor,
      fontWeight: FontWeight.w300),
);

InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  suffixIconColor: AppColors.lightThemeTextFieldEnabledColor,
  prefixIconColor: AppColors.lightThemeTextFieldEnabledColor,
  labelStyle: GoogleFonts.inter(
      fontSize: 16,
      color: AppColors.lightThemeTextColor,
      fontWeight: FontWeight.w300),
  border: OutlineInputBorder(
      borderSide: const BorderSide(
          color: AppColors.lightThemeTextFieldEnabledColor, width: 2),
      borderRadius: BorderRadius.circular(16)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
          width: 2, color: AppColors.lightThemeTextFieldEnabledColor)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 2)),
);



FloatingActionButtonThemeData lightFloatingActionButtonThemeData =
     FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        shape:OutlineInputBorder(borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.white, width: 4)));
