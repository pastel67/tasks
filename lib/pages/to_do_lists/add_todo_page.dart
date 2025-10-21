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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [textField(), SizedBox(height: 12), buttons(context)],
    );
  }

  Column textField() {
    return Column(
      children: [
        TextField(
          controller: tilteController,
          onChanged: (value) {
            setState(() {});
          }, // ValueListenableBuilder 대신 사용
          autofocus: true,
          maxLines: 1,
          onSubmitted: (value) {
            if (tilteController.text.isEmpty) {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return errorMassege(context, "내용을 입력해 주세요.");
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
            : TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '세부정보 추가',
                  hintStyle: TextStyle(fontSize: 14),
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
            : Container(),
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
            ? Container()
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
        TextButton(
          onPressed: () {
            if (tilteController.text.isEmpty) {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return errorMassege(context, "내용을 입력해 주세요.");
                },
              );
            } else {
              saveTodo();
              widget.newTodoData(newTodo);
              Navigator.pop(context);
            }
          },
          child: /*ValueListenableBuilder(
            valueListenable: tilteController,// 외국용.. 
            builder: (context, value, child) {
              return*/ Text(
            "저장",
            style: TextStyle(
              color: tilteController.text.isEmpty
                  ? Theme.of(context).dividerColor
                  : Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }

  CupertinoAlertDialog errorMassege(BuildContext contexto, String Massege) {
    return CupertinoAlertDialog(
      title: Text(Massege),
      actions: [
        CupertinoDialogAction(
          child: Text(
            "확인",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
