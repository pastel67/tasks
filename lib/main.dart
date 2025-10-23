import 'package:flutter/material.dart';
import 'package:tasks/pages/home_page.dart';
import 'package:tasks/themeData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkMode = false;

  void togled(bool modeChange) {
    setState(() {
      darkMode = modeChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 버튼으로 테마 모드 전환
      themeMode: darkMode? ThemeMode.dark : ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkThmem,
      home: HomePageLight(togled, title: "준호's Tasks"),
    );
  }
}
