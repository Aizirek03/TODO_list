import 'package:todo_list_05flu/database/app_repository.dart';
import 'package:todo_list_05flu/database/todo.dart';

class DetailsViewModel {

  final AppRepository repo;

  DetailsViewModel({
    required this.repo,
  });

  void updateTodo(
    int index,
    Todo todo,
  ) {

    repo.updateTodo(index, todo);
  }

  void deleteTodo(int index) {

    repo.deleteTodo(index);
  }
}