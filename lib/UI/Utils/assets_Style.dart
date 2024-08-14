import 'package:flutter/material.dart';
import 'package:project_todo/ui/utils/assets_color.dart';

abstract class Assets_Style {
  static const TextStyle appBarStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: App_Colors.White);

  static const TextStyle titlesTextStyle = TextStyle(
      fontSize: 27, fontWeight: FontWeight.bold, color: App_Colors.primary);

  static const TextStyle bottomSheetTitle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: App_Colors.black);

  static const TextStyle bodyTextStyle = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: App_Colors.black);

  static const TextStyle normalGreyTextStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: App_Colors.grey);

  static const TextStyle unselectedCalenderDayStyle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: App_Colors.black);

  static TextStyle selectedCalenderDayStyle =
      unselectedCalenderDayStyle.copyWith(color: App_Colors.primary);

  ///Dark Style
  static const TextStyle appBarDarkStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: App_Colors.black);
}
