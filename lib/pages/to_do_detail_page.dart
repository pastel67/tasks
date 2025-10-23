import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasks/pages/widget/show_decision_dialog.dart';
import 'package:tasks/to_do_entity.dart';

// todo 상세 페이지
class ToDoDetailPage extends StatefulWidget {
  ToDoDetailPage({
    required this.todo,
    required this.onToggleFavorite,
    required this.todoIndex,
    required this.onToggleDone,
    required this.onSaveTitle,
    required this.onSaveDescioption,
  });

  VoidCallback onToggleFavorite;
  VoidCallback onToggleDone;
  void Function(String changedTitle, int putIndex) onSaveTitle;
  void Function(String changedDescription, int putIndex) onSaveDescioption;

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

  // 페이지 상태가 변해도 타이틀과 상세 내용의 텍스트가 변경되지 않도록 이니스테이트 할수 사용
  @override
  void initState() {
    titleController = TextEditingController(text: widget.todo.title);
    descriptionController = TextEditingController(
      text: widget.todo.description,
    );
    super.initState();
  } //** 보물 **/

  // 수정된 타이틀과 상셰 내용을 저장하는 함수
  void saveChangedText() {
    putIndex = widget.todoIndex;
    String title = titleController.text;
    String description = descriptionController.text;
    widget.onSaveTitle(title,putIndex);
    widget.onSaveDescioption(description, putIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 이전 페이지 이동 위젯
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left),
        ),
        actions: [
          // 저장 버튼
          TextButton(
            onPressed: () {
              // 저장 확인 다이얼로그
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
          // 할일 완료상태 전환 버튼
          IconButton(
            onPressed: () {
              widget.onToggleDone();
              setState(() {});
            },
            icon: widget.todo.isDone
                ? Icon(Icons.check_circle_rounded, size: 24)
                : Icon(Icons.circle_outlined, size: 24),
          ),
          //즐겨찾기 상태 전환 버튼
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
                // 타이틀 보기 & 수정 텍스트 필드
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

  // 상세 목록 보기 & 수정 텍스트 필드
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
