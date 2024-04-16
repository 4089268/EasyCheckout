import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.amber.shade400,
    surface: Colors.grey.shade200,
    primary: Colors.grey.shade800,
    secondary: Colors.black87,
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.blueGrey.shade300,
    primary: Colors.grey.shade200
  )
);