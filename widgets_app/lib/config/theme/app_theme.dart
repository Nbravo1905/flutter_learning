import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.lime,
  Colors.purple
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert( selectedColor >= 0, 'El Color no puede ser 0'),
    assert( selectedColor <= colorList.length - 1, 'El Color no puede ser mayor a ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor]
  );

}