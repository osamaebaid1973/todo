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
