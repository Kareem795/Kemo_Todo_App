import 'package:flutter/material.dart';
import 'package:project_todo/ui/utils/assets_color.dart';

abstract class App_Theme {
  static ThemeData light = ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: App_Colors.bgColor,
      canvasColor: App_Colors.White,
      colorScheme: ColorScheme.fromSeed(
          seedColor: App_Colors.primary,
          primary: App_Colors.primary,
          secondary: App_Colors.White,
          onPrimary: App_Colors.White),
      appBarTheme: const AppBarTheme(
          backgroundColor: App_Colors.primary, centerTitle: true),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: App_Colors.White,
        selectedItemColor: App_Colors.primary,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 33),
        unselectedIconTheme: IconThemeData(size: 33, color: App_Colors.grey),
      ));

  /// Dark mode

  static ThemeData Dark = ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: App_Colors.bgDark,
      canvasColor: App_Colors.black,
      colorScheme: ColorScheme.fromSeed(
          seedColor: App_Colors.primary,
          primary: App_Colors.primary,
          secondary: App_Colors.black,
          onPrimary: App_Colors.black),
      appBarTheme: const AppBarTheme(
        backgroundColor: App_Colors.primary,
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: App_Colors.black,
          selectedItemColor: App_Colors.primary,
          unselectedItemColor: Colors.white));
}
