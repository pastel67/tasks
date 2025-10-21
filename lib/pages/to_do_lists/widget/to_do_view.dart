import 'package:flutter/material.dart';
import 'package:tasks/to_do_entity.dart';

class ToDoView extends StatelessWidget {
  ToDoView(
    this.todo,
    this.changedTodoData,
    this.todoIndex,
    this.isDone,
    this.isFavorite,
  );

  final ToDoEntity todo;
  void Function(ToDoEntity changedTodo, int putIndex) changedTodoData;
  int todoIndex;
  bool isDone;
  bool isFavorite;

  int putIndex = 0;
  ToDoEntity changedTodo = ToDoEntity('', '', false, false);

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
              isDone = !isDone;
              saveTodo();
              pushIndex();
              changedTodoData(changedTodo, todoIndex);
            },
            icon: todo.isDone
                ? Icon(Icons.check_circle_rounded)
                : Icon(Icons.circle_outlined),
          ),
          todo.isDone
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
              changedTodoData(changedTodo, todoIndex);
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
