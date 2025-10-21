import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: const Color.fromARGB(255, 255, 176, 6),
    secondary: const Color.fromARGB(255, 165, 110, 0),
    seedColor: const Color.fromARGB(255, 255, 180, 17),
    brightness: Brightness.light,
  ),
  dividerColor: Colors.black87,
  
);

final darkThmem = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: const Color.fromARGB(255, 56, 0, 120),
    secondary: const Color.fromARGB(255, 191, 154, 255),
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  dividerColor: Colors.white54,
);
