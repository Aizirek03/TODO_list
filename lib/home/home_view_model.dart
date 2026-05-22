import 'package:todo_list_05flu/database/app_repository.dart';
import 'package:todo_list_05flu/database/todo.dart';

class HomeViewModel {

  final AppRepository repo;

  HomeViewModel({
    required this.repo,
  });

  List<Todo> todoList = [];

  void getTodoList() {

    todoList = repo.getTodoList();
  }

  void deleteTodo(int index) {

    repo.deleteTodo(index);

    getTodoList();
  }
}