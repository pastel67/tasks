import 'package:flutter/material.dart';

class ListPageDarkMode extends StatefulWidget {
  void Function(bool modeChange) togleMode;

  ListPageDarkMode(this.togleMode);

  @override
  State<ListPageDarkMode> createState() => _ListPageDarkModeState();
}

class _ListPageDarkModeState extends State<ListPageDarkMode> {
  bool modeChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "준호's Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Text(
            "다크모드 on",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          IconButton(
            icon: Icon(Icons.toggle_off, color: Colors.grey),
            onPressed: () {
              setState(() {
                modeChange = !modeChange;

                widget.togleMode(modeChange);
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: Colors.black54,
          height: 250,
          width: double.infinity,
          child: Column(),
        ),
      ),
    );
  }
}
