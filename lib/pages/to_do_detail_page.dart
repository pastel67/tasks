import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasks/pages/widget/show_decision_dialog.dart';
import 'package:tasks/to_do_entity.dart';

class ToDoDetailPage extends StatefulWidget {
  ToDoDetailPage({
    required this.todo,
    required this.onToggleFavorite,
    required this.todoIndex,
    required this.onToggleDone,
    required this.onSaveContent,
  });

  VoidCallback onToggleFavorite;
  VoidCallback onToggleDone;
  void Function(String changedTitle, String changedDescription, int putIndex)
  onSaveContent;
  int todoIndex;
  ToDoEntity todo;

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ToDoEntity changedTodo = ToDoEntity('', '', false, false);

  int putIndex = 0;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.todo.title);
    descriptionController = TextEditingController(
      text: widget.todo.description,
    );
    super.initState();
  } //** 보물 **/

  void saveChangedText() {
    putIndex = widget.todoIndex;
    String title = titleController.text;
    String description = descriptionController.text;
    widget.onSaveContent(title, description, putIndex);
  }

  @override
  Widget build(BuildContext context) {
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
              showDecisionDialog(
                context: context,
                title: '저장 하시겠습니까?',
                denyMessage: '아니오',
                acceptMessage: '예',
                function: () {
                  saveChangedText();
                },
              );
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
              widget.onToggleDone();
              setState(() {});
            },
            icon: widget.todo.isDone
                ? Icon(Icons.check_circle_rounded, size: 24)
                : Icon(Icons.circle_outlined, size: 24),
          ),
          IconButton(
            onPressed: () {
              widget.onToggleFavorite();
              setState(() {});
            },
            icon: widget.todo.isFavorite
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                child: TextField(
                  controller: titleController,
                  cursorColor: Theme.of(context).dividerColor,
                  decoration: InputDecoration(border: InputBorder.none),

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
                  controller: descriptionController,
                  cursorColor: Theme.of(context).dividerColor,
                  keyboardType: TextInputType.multiline,
                  minLines: 30,
                  maxLines: null,
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
