import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_connector/core/color/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.rubik().fontFamily,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.white,
  dividerTheme: const DividerThemeData(color: AppColors.grey),
  dialogBackgroundColor: AppColors.white,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.primary, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.secondary, fontSize: 14),
    bodySmall: TextStyle(color: AppColors.secondary, fontSize: 12),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.white,
    titleTextStyle: TextStyle(
      color: AppColors.grey,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.grey),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.white,
    height: 60,
    padding: EdgeInsets.symmetric(
      horizontal: 8,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.grey,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    shape: CircleBorder(),
  ),
  datePickerTheme: const DatePickerThemeData(
    backgroundColor: AppColors.white,
    headerBackgroundColor: AppColors.white,
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);
