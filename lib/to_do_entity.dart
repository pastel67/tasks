// 인자를 사용하기 위한 클래스 정의
class ToDoEntity {
  String title;
  String? description;
  bool isFavorite;
  bool isDone;

  ToDoEntity(this.title, this.description, this.isFavorite, this.isDone);
}
