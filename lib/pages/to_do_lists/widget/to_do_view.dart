import 'package:flutter/material.dart';

class ToDoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 80, 
        color: Colors.amber, 
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Text("ToDoView"),
      ),
    );
  }
}
