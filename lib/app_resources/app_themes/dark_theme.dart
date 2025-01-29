import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/app_resources/app_colors.dart';


AppBarTheme darkAppBarTheme = const AppBarTheme(
    color: AppColors.darkThemeBackgroundColor,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.primaryColor));

BottomNavigationBarThemeData darkBottomNavigationBarThemeData =
    const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkThemeBackgroundColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white);

TextTheme darkTextTheme = TextTheme(
    titleMedium: GoogleFonts.inter(
        fontSize: 20,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold),
    bodySmall: GoogleFonts.inter(
        fontSize: 16,
        color: AppColors.darkThemeTextColor,
        fontWeight: FontWeight.w300));

InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  suffixIconColor: AppColors.primaryColor,
  prefixIconColor: AppColors.primaryColor,
  labelStyle: GoogleFonts.inter(
      fontSize: 16, color: AppColors.primaryColor, fontWeight: FontWeight.w300),
  border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(16)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 2, color: AppColors.primaryColor)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 2)),
);


FloatingActionButtonThemeData darkFloatingActionButtonThemeData =
     FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        shape:OutlineInputBorder(borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.white, width: 4)));
