import 'package:flutter/material.dart';
import 'package:tasks/pages/to_do_lists/home_page.dart';
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
      print(4);
      darkMode = modeChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: darkMode? ThemeMode.dark : ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkThmem,
      home: HomePageLight(togled),
    );
  }
}
