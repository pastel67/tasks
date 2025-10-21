import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasks/pages/widget/show_decision_dialog.dart';
import 'package:tasks/to_do_entity.dart';

class ToDoDetailPage extends StatefulWidget {
  ToDoDetailPage({
    required this.todoIndex,
    required this.description,
    required this.todo,
    required this.title,
    required this.isFavorite,
    required this.changedTodoData,
  });

  void Function(ToDoEntity changedTodo, int putIndex) changedTodoData;

  int todoIndex;
  ToDoEntity todo;

  String title;
  String? description;
  bool isFavorite;

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  ToDoEntity changedTodo = ToDoEntity('', '', false, false);

  int putIndex = 0;

  void changeTodo() {
    putIndex = widget.todoIndex;
    changedTodo = ToDoEntity(
      widget.title,
      widget.description,
      widget.isFavorite,
      widget.todo.isDone,
    );
  }

  void saveChangedText(String title, String description) {
    widget.title = title;
    widget.description = description;
    changeTodo();
    widget.changedTodoData(changedTodo, putIndex);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(
      text: widget.title,
    );
    TextEditingController descriptionController = TextEditingController(
      text: widget.description,
    );

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showDecisionDialog(context, '저장 하시겠습니까?', '아니오', '예', () {
                saveChangedText(
                  titleController.text,
                  descriptionController.text,
                );
              });
            },
            child: Text(
              "저장",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              widget.isFavorite = !widget.isFavorite;
              changeTodo();
              widget.changedTodoData(changedTodo, putIndex);
              setState(() {});
            },
            icon: widget.isFavorite
                ? Icon(
                    Icons.star,
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                : Icon(Icons.star_border, size: 24),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                child: TextField(
                  cursorColor: Theme.of(context).dividerColor,
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: titleController,

                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                color: Theme.of(context).dividerColor,
                thickness: 5.0,
                indent: 10,
                endIndent: 10,
                height: 10,
              ),
              descriptionInputField(context, descriptionController),
            ],
          ),
        ),
      ),
    );
  }

  Expanded descriptionInputField(
    BuildContext context,
    TextEditingController descriptionController,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.short_text_rounded),
            SizedBox(width: 10),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  cursorColor: Theme.of(context).dividerColor,
                  keyboardType: TextInputType.multiline,
                  minLines: 30,
                  maxLines: null,
                  controller: descriptionController,
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
