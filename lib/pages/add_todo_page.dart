import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/to_do_entity.dart';

class AddTodoPage extends StatefulWidget {
  void Function(ToDoEntity newTodo) addTodoData;

  AddTodoPage(this.addTodoData);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController tilteController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isDescription = true;
  bool isFavorite = false;

  ToDoEntity newTodo = ToDoEntity('', '', false, false);

  void saveTodo() {
    ToDoEntity inputTodo = ToDoEntity(
      tilteController.text,
      descriptionController.text,
      isFavorite,
      false,
    );
    newTodo = inputTodo;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textField(),
          SizedBox(height: 12),
          buttons(context),
          SizedBox(height: 6),
        ],
      ),
    );
  }

  Column textField() {
    return Column(
      children: [
        TextField(
          cursorColor: Theme.of(context).dividerColor,
          controller: tilteController,
          onChanged: (value) {
            setState(() {});
          },
          autofocus: true,
          maxLines: 1,
          onSubmitted: (value) {
            if (tilteController.text.isEmpty) {
              errorDialog(context);
            } else {
              saveTodo();
              widget.addTodoData(newTodo);
              Navigator.pop(context);
            }
          },
          decoration: InputDecoration(
            hintText: '새 할 일',
            hintStyle: TextStyle(fontSize: 16),
          ),
        ),
        isDescription
            ? SizedBox()
            : SingleChildScrollView(
                child: TextField(
                  cursorColor: Theme.of(context).dividerColor,
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '세부정보 추가',
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
      ],
    );
  }

  Row buttons(BuildContext context) {
    return Row(
      children: [
        isDescription
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isDescription = !isDescription;
                  });
                },
                icon: Icon(Icons.short_text_rounded, size: 24),
              )
            : SizedBox(),
        IconButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: isFavorite
              ? Icon(
                  Icons.star,
                  size: 24,
                  color: Theme.of(context).colorScheme.secondary,
                )
              : Icon(Icons.star_border, size: 24),
        ),
        Spacer(),

        isDescription
            ? SizedBox()
            : TextButton(
                onPressed: () {
                  setState(() {
                    isDescription = !isDescription;
                  });
                },
                child: Text(
                  "취소",
                  style: TextStyle(color: Theme.of(context).dividerColor),
                ),
              ),

        tilteController.text.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: TextButton(
                  onPressed: () {
                    errorDialog(context);
                  },
                  child: Text(
                    "저장",
                    style: TextStyle(color: Theme.of(context).dividerColor),
                  ),
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  saveTodo();
                  widget.addTodoData(newTodo);
                  Navigator.pop(context);
                },
                child: Text(
                  "저장",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        SizedBox(width: 5),
      ],
    );
  }

  Future<dynamic> errorDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("내용을 입력해 주세요."),
          actions: [
            CupertinoDialogAction(
              child: Text(
                "확인",
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
