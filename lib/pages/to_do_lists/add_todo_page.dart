import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/to_do_entity.dart';

class AddTodoPage extends StatefulWidget {
  void Function(ToDoEntity newTodo) newTodoData;

  AddTodoPage(this.newTodoData);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController tilteController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool onToggleDescription = true;
  bool onToggleFavorite = false;

  ToDoEntity newTodo = ToDoEntity('', '', false, false);

  void saveTodo() {
    ToDoEntity inputTodo = ToDoEntity(
      tilteController.text,
      descriptionController.text,
      onToggleFavorite,
      false,
    );
    newTodo = inputTodo;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).viewInsets.bottom,
      ),
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
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: tilteController,
          onChanged: (value) {
            setState(() {});
          },
          autofocus: true,
          maxLines: 1,
          onSubmitted: (value) {
            if (tilteController.text.isEmpty) {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text("내용을 입력해 주세요."),
                    actions: [
                      CupertinoDialogAction(
                        child: Text(
                          "확인",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              saveTodo();
              widget.newTodoData(newTodo);
              Navigator.pop(context);
            }
          },
          decoration: InputDecoration(
            hintText: '새 할 일',
            hintStyle: TextStyle(fontSize: 16),
          ),
        ),

        onToggleDescription
            ? SizedBox()
            : Expanded(
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 10,
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
        onToggleDescription
            ? IconButton(
                onPressed: () {
                  setState(() {
                    onToggleDescription = !onToggleDescription;
                  });
                },
                icon: Icon(Icons.short_text_rounded, size: 24),
              )
            : SizedBox(),
        IconButton(
          onPressed: () {
            setState(() {
              onToggleFavorite = !onToggleFavorite;
            });
          },
          icon: onToggleFavorite
              ? Icon(
                  Icons.star,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                )
              : Icon(Icons.star_border, size: 24),
        ),
        Spacer(),

        onToggleDescription
            ? SizedBox()
            : TextButton(
                onPressed: () {
                  setState(() {
                    onToggleDescription = !onToggleDescription;
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
                  widget.newTodoData(newTodo);
                  Navigator.pop(context);
                },
                child: Text(
                  "저장",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
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
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
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
