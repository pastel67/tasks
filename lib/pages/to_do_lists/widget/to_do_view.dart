import 'package:flutter/material.dart';
import 'package:tasks/to_do_entity.dart';

class ToDoView extends StatefulWidget {
  ToDoView(this.todo, this.onToggleFavorite,  this.newTodoData);

  final ToDoEntity todo;
  void Function(ToDoEntity newTodo) newTodoData;
  bool onToggleFavorite;

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  ToDoEntity newTodo = ToDoEntity('', '', false, false);

  bool onToggleDone = false;

  void saveTodo() {
    ToDoEntity inputTodo = ToDoEntity(
      widget.todo.title,
      widget.todo.description,
      widget.onToggleFavorite,
      onToggleDone,
    );
    newTodo = inputTodo;
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
           
                onToggleDone = !onToggleDone;
       
            },
            icon: onToggleDone
                ? Icon(Icons.check_circle_rounded)
                : Icon(Icons.circle_outlined),
          ),
          onToggleDone
              ? Text(
                  widget.todo.title,
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                )
              : Text(widget.todo.title),
          Spacer(),
          IconButton(
            onPressed: () {
              
                print(widget.onToggleFavorite);
                widget.onToggleFavorite = !widget.onToggleFavorite;
                print(widget.onToggleFavorite);
            
            },
            icon: widget.onToggleFavorite
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
