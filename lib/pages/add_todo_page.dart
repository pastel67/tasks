import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/pages/widget/show_decision_dialog.dart';
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

  //새로운 투두 리스트 생성 함수
  void saveTodo() {
    ToDoEntity inputTodo = ToDoEntity(
      tilteController.text.trim(),
      descriptionController.text.trim(),
      isFavorite,
      false,
    );
    newTodo = inputTodo;
  }

  // void stayDescription (String descriptionController.text){
  //   descriptionController = descriptionController.text
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [textField(), buttons(context), SizedBox(height: 6)],
    );
  }

  // 타이틀 및 상세내용 작성 텍스트 필드
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
            : TextField(
                controller: descriptionController,
                cursorColor: Theme.of(context).dividerColor,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 6,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '세부정보 추가',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
      ],
    );
  }

  // 하단부 버튼 모음
  Widget buttons(BuildContext context) {
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
        // 상세 내용 입력 상태 시 입력 취소 버튼 활성/비활성화
        isDescription
            ? SizedBox()
            : TextButton(
                onPressed: () {
                  setState(() {
                    showDecisionDialog(
                      context: context,
                      title: "취소시 입력 하신 내용이\n삭제 됩니다.\n취소 하시겠습니까?",
                      denyMessage: "아니오",
                      acceptMessage: '예',
                      acceptFunction: () {
                        descriptionController.clear();
                        isDescription = !isDescription;
                        setState(() {});
                      },
                    );
                  });
                },
                child: Text(
                  "취소",
                  style: TextStyle(color: Theme.of(context).dividerColor),
                ),
              ),

        // 입력 내용 저장 버튼 활성화 시 상태 변화
        tilteController.text.isEmpty
            ? TextButton(
                onPressed: () {
                  errorDialog(context);
                },
                child: Text(
                  "저장",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
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
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
        SizedBox(width: 10),
      ],
    );
  }

  // 타이틀 입력 하지 않고
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
