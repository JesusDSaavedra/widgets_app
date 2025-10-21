import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.deepOrange,
  Colors.amber,
  Colors.brown,
  Colors.blueAccent,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 0})
    : assert(selectedColor >= 0, 'Selected color most be greater then 0'),
      assert(
        selectedColor < colorList.length,
        'Selected color most be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: true),
  );
}
