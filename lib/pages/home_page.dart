import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/pages/add_todo_page.dart';
import 'package:tasks/pages/to_do_detail_page.dart';
import 'package:tasks/pages/widget/non_to_do_list.dart';
import 'package:tasks/pages/widget/show_decision_dialog.dart';
import 'package:tasks/pages/widget/to_do_view.dart';
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

  void deleteTodoData(int inputIndex) {
    setState(() {
      todoDataList.remove(todoDataList[inputIndex]);
    });
  }

  void onSaveContents(
    String changedTitle,
    String changedDescription,
    int index,
  ) {
    setState(() {
      todoDataList[index].title = changedTitle;
      todoDataList[index].description = changedDescription;
      print('${todoDataList[index].title},$changedTitle로 내용 변경됨');
    });
  }

  void onToggleFavorite(bool toggledFavorite, int putIndex) {
    setState(() {
      todoDataList[putIndex].isFavorite = !todoDataList[putIndex].isFavorite;
      print('$putIndex번 ${todoDataList[putIndex].isFavorite} - isFavorite');
    });
  }

  void onToggleDone(bool toggledDone, int putIndex) {
    setState(() {
      todoDataList[putIndex].isDone = !todoDataList[putIndex].isDone;
      print('$putIndex번 ${todoDataList[putIndex].isDone} - isDone');
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

      body: todoDataList.isEmpty ? NonToDoList(appTitle) : toDoView(),
      resizeToAvoidBottomInset: false,
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ToDoDetailPage(
                      todo: todoDataList[index],
                      todoIndex: index,

                      onToggleFavorite: () {
                        onToggleFavorite(todoDataList[index].isFavorite, index);
                      },
                      onToggleDone: () {
                        onToggleDone(todoDataList[index].isDone, index);
                      },
                      onSaveContent: onSaveContents,
                    ),
                  ),
                );
              },
              onLongPress: () {
                showDecisionDialog(
                  context: context,
                  title: '이 할일을 삭제 하시겠습니까?',
                  denyMessage: '아니오',
                  acceptMessage: '예',
                  function: () {
                    deleteTodoData(index);
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: ToDoView(
                  todo: todoDataList[index],
                  onToggleFavorite: () {
                    onToggleFavorite(todoDataList[index].isFavorite, index);
                  },
                  onToggleDone: () {
                    onToggleDone(todoDataList[index].isDone, index);
                  },
                ),
              ),
            ),
          );
        },
        itemCount: todoDataList.length,
      ),
    );
  }
}
