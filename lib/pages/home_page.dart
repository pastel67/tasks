import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/pages/add_todo_page.dart';
import 'package:tasks/pages/to_do_detail_page.dart';
import 'package:tasks/pages/widget/non_to_do_list.dart';
import 'package:tasks/pages/widget/show_decision_dialog.dart';
import 'package:tasks/pages/widget/to_do_view.dart';
import 'package:tasks/to_do_entity.dart';

//홈 페이지
class HomePageLight extends StatefulWidget {
  // 테마 전환 정보를 전달하기 위한 함수형 속성
  void Function(bool darkModeChange) togleMode;

  HomePageLight(this.togleMode);

  @override
  State<HomePageLight> createState() => _HomePageLightState();
}

class _HomePageLightState extends State<HomePageLight> {
  // 앱 타이틀 설정
  final String appTitle = "준호's Tasks";

  bool darkModeChange = false; //true 면 다크 테마. false 면 라이트 테마

  //할일 저장 리스트
  List<ToDoEntity> todoDataList = [];

  //새로 입력한 정보를 리스트에 저장 함수
  void addTodo(ToDoEntity newTodo) {
    setState(() {
      todoDataList.add(newTodo);
    });
  }

  //저장된 특정 todo 리스트를 삭제 함수
  void deleteTodoData(int inputIndex) {
    setState(() {
      todoDataList.remove(todoDataList[inputIndex]);
    });
  }

  // 특정 todo의 상세 페이지에서 변경된 타이틀 저장 함수
  void onChangedTitle(String changedTitle, int index) {
    setState(() {
      todoDataList[index].title = changedTitle;
    });
  }

  // 특정 todo의 상세 페이지에서 변경된 상세내용 저장 함수
  void onChangedDescription(String?  changedDescription, int? index) {
    setState(() {
      if(index == null){
      }else{
      todoDataList[index].description = changedDescription;}
    });
  }

  // 특정 todo의 즐겨찾기 상태 변환 함수
  void onToggleFavorite(bool toggledFavorite, int putIndex) {
    setState(() {
      todoDataList[putIndex].isFavorite = !todoDataList[putIndex].isFavorite;
    });
  }

  // 특정 todo의 완료 상태 변환 함수
  void onToggleDone(bool toggledDone, int putIndex) {
    setState(() {
      todoDataList[putIndex].isDone = !todoDataList[putIndex].isDone;
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
          // 테마 모드 변경 버튼
          IconButton(
            icon: darkModeChange
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
                darkModeChange = !darkModeChange;
                widget.togleMode(darkModeChange);
              });
            },
          ),
        ],
      ),

      body: todoDataList.isEmpty ? NonToDoList(appTitle) : toDoView(),
      resizeToAvoidBottomInset: false,

      // 할일 추가 하는 플로팅 액선 버튼
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
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

  // toDoView 카드를 보여주는 리스트뷰 위젯
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
                      onSaveTitle: onChangedTitle,
                      onSaveDescioption: onChangedDescription,
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
