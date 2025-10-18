import 'package:flutter/material.dart';
import 'package:to_do_app_ui/pages/to_do_lists/list_page_dark.dart';
import 'package:to_do_app_ui/pages/to_do_lists/list_page_light.dart';
import 'package:to_do_app_ui/themeData.dart';

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
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkThmem,
      home: darkMode ? ListPageDarkMode(togled) : ListPageLightMode(togled),
    );
  }
}
