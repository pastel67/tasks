import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: const Color.fromARGB(255, 213, 142, 0),
    secondary: Colors.amber,
    seedColor: const Color.fromARGB(255, 255, 180, 17),
    brightness: Brightness.light,
  ),
  dividerColor: const Color.fromARGB(255, 168, 101, 0), // 선색 또는 글씨 색에 쓰면 좋을 듯
  scaffoldBackgroundColor: Colors.grey[400],
);

final darkThmem = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: const Color.fromARGB(255, 94, 51, 159),
    secondary: const Color.fromARGB(255, 182, 136, 255),
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  dividerColor: const Color.fromARGB(255, 221, 180, 255),
  scaffoldBackgroundColor: Colors.grey[600],
);
