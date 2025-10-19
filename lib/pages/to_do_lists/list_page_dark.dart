import 'package:flutter/material.dart';
import 'package:tasks/pages/to_do_lists/widget/floating_button.dart';
import 'package:tasks/pages/to_do_lists/widget/meggage.dart';

class ListPageDarkMode extends StatefulWidget {
  void Function(bool modeChange) togleMode;

  ListPageDarkMode(this.togleMode);

  @override
  State<ListPageDarkMode> createState() => _ListPageDarkModeState();
}

class _ListPageDarkModeState extends State<ListPageDarkMode> {
  bool modeChange = true;
  final String appTitle = "준호's Tasks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.nightlight,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              setState(() {
                modeChange = !modeChange;
                widget.togleMode(modeChange);
              });
            },
          ),
        ],
      ),
      body: Messages(appTitle: appTitle),
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingButton(context),
    );
  }
}
