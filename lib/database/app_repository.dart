import 'package:todo_list_05flu/database/app_database.dart';
import 'package:todo_list_05flu/database/todo.dart';

abstract class AppRepository {

  List<Todo> getTodoList();

  void addTodo(Todo todo);

  void deleteTodo(int index);

  void updateTodo(
    int index,
    Todo todo,
  );

  void updateTodoState(
    int index,
    bool isDone,
  );
}

class AppRepositoryImpl
    implements AppRepository {

  final AppDatabase db;

  AppRepositoryImpl({
    required this.db,
  });

  @override
  List<Todo> getTodoList() {

    return db.getTodoList();
  }

  @override
  void addTodo(Todo todo) {

    db.addTodo(todo);
  }

  @override
  void deleteTodo(int index) {

    db.deleteTodo(index);
  }

  @override
  void updateTodo(
    int index,
    Todo todo,
  ) {

    db.updateTodo(index, todo);
  }

  @override
  void updateTodoState(
    int index,
    bool isDone,
  ) {

    db.updateTodoState(
      index,
      isDone,
    );
  }
}