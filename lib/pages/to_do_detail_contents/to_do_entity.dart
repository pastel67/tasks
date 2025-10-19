import 'package:flutter/material.dart';

class ToDoEntity extends StatelessWidget {
  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;

  ToDoEntity(this.title, this.description, this.isDone, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    return Text("ToDoEntity");
  }
}
