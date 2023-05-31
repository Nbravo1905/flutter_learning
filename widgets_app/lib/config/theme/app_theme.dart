import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.lime,
  Colors.purple,
  Colors.red,
  Colors.green,
  Colors.pink
];

class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false
  }): assert( selectedColor >= 0, 'El Color no puede ser 0'),
    assert( selectedColor <= colorList.length - 1, 'El Color no puede ser mayor a ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor]
  );

}