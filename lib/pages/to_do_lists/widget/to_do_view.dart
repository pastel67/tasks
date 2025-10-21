import 'package:flutter/material.dart';
import 'package:tasks/to_do_entity.dart';

class ToDoView extends StatelessWidget {
  ToDoView(this.todo, this.changedTodoData, this.giveIndex, this.todoIndex);

  final ToDoEntity todo;
  void Function(ToDoEntity changedTodo) changedTodoData;
  void Function(int putIndex) giveIndex;
  int todoIndex;

  ToDoEntity changedTodo = ToDoEntity('', '', false, false);

  bool isDone = false;
  bool isFavorite = false;
  int putIndex = 0;

  void saveTodo() {
    ToDoEntity inputTodo = ToDoEntity(
      todo.title,
      todo.description,
      isFavorite,
      isDone,
    );
    changedTodo = inputTodo;
  }

  void pushIndex() {
    putIndex = todoIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              print('$isDone _1');
              isDone = !isDone;
              print('$isDone _2');
              saveTodo();
              pushIndex();
              giveIndex(putIndex);
              changedTodoData(changedTodo);
            },
            icon: isDone
                ? Icon(Icons.check_circle_rounded)
                : Icon(Icons.circle_outlined),
          ),
          isDone
              ? Text(
                  todo.title,
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                )
              : Text(todo.title),
          Spacer(),
          IconButton(
            onPressed: () {
              isFavorite = !isFavorite;
              saveTodo();
              pushIndex();
              giveIndex(putIndex);
              changedTodoData(changedTodo);
            },
            icon: isFavorite
                ? Icon(
                    Icons.star,
                    size: 24,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : Icon(Icons.star_border, size: 24),
          ),
        ],
      ),
    );
  }
}
