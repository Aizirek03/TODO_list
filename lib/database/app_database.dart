import 'package:todo_list_05flu/database/todo.dart';

class AppDatabase {

  final List<Todo> _todoList = [

    Todo(
      id: 1,
      title: "Flutter",
      isDone: false,
      createdAt: "14:00",
    ),

    Todo(
      id: 2,
      title: "Dinner",
      isDone: false,
      createdAt: "15:00",
    ),
  ];

  List<Todo> getTodoList() {

    return _todoList;
  }

  void addTodo(Todo todo) {

    _todoList.insert(0, todo);
  }

  void deleteTodo(int index) {

    _todoList.removeAt(index);
  }

  void updateTodo(
    int index,
    Todo todo,
  ) {

    _todoList[index] = todo;
  }
}