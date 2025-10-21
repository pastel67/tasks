import 'package:flutter/material.dart';
import 'package:tasks/pages/to_do_lists/add_todo_page.dart';
import 'package:tasks/pages/to_do_lists/widget/non_to_do_list.dart';
import 'package:tasks/pages/to_do_lists/widget/to_do_view.dart';
import 'package:tasks/to_do_entity.dart';

class HomePageLight extends StatefulWidget {
  void Function(bool modeChange) togleMode;

  HomePageLight(this.togleMode);

  @override
  State<HomePageLight> createState() => _HomePageLightState();
}

class _HomePageLightState extends State<HomePageLight> {
  final String appTitle = "준호's Tasks";
  bool modeChange = false;

  List<ToDoEntity> todoDataList = [];

  void addTodo(ToDoEntity newTodo) {
    setState(() {
      todoDataList.add(newTodo);
    });
  }

  void onChangeTodoData(ToDoEntity changedTodo, int putIndex) {
    setState(() {
      print(putIndex);
      todoDataList[putIndex] = changedTodo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: modeChange
                ? Icon(
                    Icons.nightlight,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                : Icon(
                    Icons.sunny,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            onPressed: () {
              setState(() {
                modeChange = !modeChange;
                widget.togleMode(modeChange);
              });
            },
          ),
        ],
      ),

      body: todoDataList.isEmpty
          ? NonToDoList(appTitle)
          : GestureDetector(
            onTap:() {
              print('페이지 넘어갈거임');  
            },
            onLongPress: () {
              print('투두 삭제할 거임');
            },
            child: toDoView()),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  12,
                  20,
                  MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTodoPage(addTodo),
              );
            },
          );
        },
        child: Icon(Icons.add, size: 24),
      ),
    );
  }

  Widget toDoView() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: ToDoView(
                todoDataList[index],
                onChangeTodoData,
                index,
                todoDataList[index].isDone,
                todoDataList[index].isFavorite,
              ),
            ),
          );
        },
        itemCount: todoDataList.length,
      ),
    );
  }
}
