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
        fontSize: 20,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold),
    bodySmall: GoogleFonts.inter(
        fontSize: 16,
        color: AppColors.lightThemeTextColor,
        fontWeight: FontWeight.w300));
