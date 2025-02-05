import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_connector/core/color/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.rubik().fontFamily,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.white,
  dividerTheme: const DividerThemeData(color: AppColors.dividerColor),
  dialogBackgroundColor: AppColors.white,
  canvasColor: AppColors.white,
  splashColor: AppColors.primary,
  highlightColor: AppColors.primary,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.black, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.black, fontSize: 14),
    bodySmall: TextStyle(color: AppColors.black, fontSize: 12),
  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.primary),
  tabBarTheme: TabBarTheme(
    indicatorColor: AppColors.primary,
    labelColor: AppColors.primary,
    unselectedLabelColor: AppColors.black,
    dividerColor: Colors.transparent,
    dividerHeight: 0,
  ),
  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsets.zero,
    minLeadingWidth: 0,
    minTileHeight: 0,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    color: AppColors.white,
    titleTextStyle: TextStyle(
      color: AppColors.darkGrey,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.lightGrey),
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
    unselectedItemColor: AppColors.darkGrey,
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
