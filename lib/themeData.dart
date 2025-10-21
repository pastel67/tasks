import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: const Color.fromARGB(255, 255, 170, 0),
    secondary: const Color.fromARGB(255, 255, 189, 46),
    seedColor: const Color.fromARGB(255, 255, 180, 17),
    brightness: Brightness.light,
  ),
  dividerColor: const Color.fromARGB(255, 111, 72, 0),
  scaffoldBackgroundColor: Colors.grey[400],
);

final darkThmem = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: const Color.fromARGB(255, 56, 0, 120),
    secondary: const Color.fromARGB(255, 191, 154, 255),
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  dividerColor: const Color.fromARGB(255, 216, 199, 230),
  scaffoldBackgroundColor: Colors.grey[600],
);
