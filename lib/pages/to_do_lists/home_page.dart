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
  List<ToDoEntity> todoData = [];

  void TodoData(ToDoEntity newTodo) {
    setState(() {
      todoData.add(newTodo);
      print(todoData[0].title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: modeChange ? Colors.grey[600] : Colors.grey[400],

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
                    color: Theme.of(context).colorScheme.primary,
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

      body: todoData.isEmpty
          ? NonToDoList(appTitle)
          : ListView.separated(
              itemBuilder: (context, index) {
                return ToDoView();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount: todoData.length,
            ),

      resizeToAvoidBottomInset: false,

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTodoPage(TodoData),
              );
            },
          );
        },
        child: Icon(Icons.add, size: 24),
      ),
    );
  }
}
