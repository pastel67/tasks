import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: Colors.amber,
    secondary: const Color.fromARGB(255, 255, 228, 132),
    seedColor: const Color.fromARGB(255, 255, 180, 17),
    brightness: Brightness.light,
  ),
  dividerColor: Colors.black54,
);

final darkThmem = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: const Color.fromARGB(255, 56, 0, 120),
    secondary: Colors.deepPurple,
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  dividerColor: Colors.white54,
);
