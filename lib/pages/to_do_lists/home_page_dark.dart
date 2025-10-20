import 'package:flutter/material.dart';
import 'package:tasks/pages/to_do_lists/add_todo_page.dart';
import 'package:tasks/pages/to_do_lists/widget/non_to_do_list.dart';

class HomePageDark extends StatefulWidget {
  void Function(bool modeChange) togleMode;

  HomePageDark(this.togleMode);

  @override
  State<HomePageDark> createState() => _HomePageDarkState();
}

class _HomePageDarkState extends State<HomePageDark> {
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
      body: NonToDoList(appTitle),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
    backgroundColor: Theme.of(context).colorScheme.primary,
    shape: CircleBorder(),
    onPressed: () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
          );
        },
      );
    },
    child: Icon(Icons.add, size: 24),
  ),
    );
  }
}
