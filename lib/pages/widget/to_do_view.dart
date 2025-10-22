import 'package:flutter/material.dart';
import 'package:tasks/to_do_entity.dart';

class ToDoView extends StatelessWidget {
  ToDoView({
    required this.todo,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });
  VoidCallback onToggleFavorite;
  VoidCallback onToggleDone;

  final ToDoEntity todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          // 할일 완료 상태 변경 버튼
          IconButton(
            onPressed: () {
              onToggleDone();
            },
            icon: todo.isDone
                ? Icon(Icons.check_circle_rounded)
                : Icon(Icons.circle_outlined),
          ),
          Expanded(
            child: Container(
              child: todo.isDone
                  ? Text( 
                      overflow: TextOverflow.ellipsis, // 카드 보다 긴 타이틀 입력시... 으로  표시
                      todo.title,
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    )
                  : Text(todo.title, overflow: TextOverflow.ellipsis),
            ),
          ),
          SizedBox(width: 12),
          //즐겨찾기 상태 변경 버튼
          IconButton(
            onPressed: () {
              onToggleFavorite();
            },
            icon: todo.isFavorite
                ? Icon(
                    Icons.star,
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                : Icon(Icons.star_border, size: 24),
          ),
        ],
      ),
    );
  }
}
