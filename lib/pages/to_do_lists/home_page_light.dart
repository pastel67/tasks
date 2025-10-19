import 'package:flutter/material.dart';
import 'package:tasks/pages/to_do_lists/widget/floating_button.dart';
import 'package:tasks/pages/to_do_lists/widget/meggage.dart';

class HomePageLight extends StatefulWidget {
  void Function(bool modeChange) togleMode;

  HomePageLight(this.togleMode);

  @override
  State<HomePageLight> createState() => _HomePageLightState();
}

class _HomePageLightState extends State<HomePageLight> {
  bool modeChange = false;
  final String appTitle = "준호's Tasks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.sunny,
              color: Theme.of(context).colorScheme.primary,
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
      body: Messages(appTitle),
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingButton(context),
    );
  }
}
