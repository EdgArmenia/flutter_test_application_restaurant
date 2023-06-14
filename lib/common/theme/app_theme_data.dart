import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

// Темы для виджетов
ThemeData appThemeData() {
  return ThemeData(
    cardTheme: const CardTheme(
      elevation: 0.0,
      color: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 3.0,
      selectedItemColor: AppColors.selectedButtonColor,
      unselectedItemColor: AppColors.unselectedBottomBarIconColor,
      showUnselectedLabels: true,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 80.0,
      elevation: 0.0,
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 22.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        color: Colors.grey,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
      ),
    ),
    fontFamily: 'SF PRO Display',
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     elevation: MaterialStatePropertyAll(0.0),
    //   ),
    // )
    // iconTheme: IconTheme(
    //   data: data,
    //   child: child,
    // ),
  );
}
