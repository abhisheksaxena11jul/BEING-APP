class ToDo1{
  String? id;
  String? todoText;
  bool isDone;

  ToDo1({
    required this.id,
    required this.todoText,
    this.isDone = false
  });

  static List<ToDo1> todoList() {
    return [

    ];
  }

}