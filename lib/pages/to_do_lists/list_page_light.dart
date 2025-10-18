import 'package:flutter/material.dart';

class ListPageLightMode extends StatefulWidget {
  void Function(bool modeChange) togleMode;

  ListPageLightMode(this.togleMode);

  @override
  State<ListPageLightMode> createState() => _ListPageLightModeState();
}

class _ListPageLightModeState extends State<ListPageLightMode> {
  bool modeChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "준호's Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Text(
            "다크모드 off",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          IconButton(
            icon: Icon(Icons.toggle_on),
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
          color: Colors.white54,
          width: double.infinity,
          child: Column(),
        ),
      ),
    );
  }
}
