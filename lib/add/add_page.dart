import 'package:flutter/material.dart';
import 'package:todo_list_05flu/add/add_view_model.dart';
import 'package:todo_list_05flu/database/app_database.dart';
import 'package:todo_list_05flu/database/app_repository.dart';
import 'package:todo_list_05flu/database/todo.dart';

class AddPage extends StatefulWidget {

  final AppDatabase database;

  const AddPage({
    required this.database,
    super.key,
  });

  @override
  State<AddPage> createState() =>
      _AddPageState();
}

class _AddPageState
    extends State<AddPage> {

  final TextEditingController _controller =
      TextEditingController();

  late final AddViewModel vm;

  late final AppDatabase db;

  @override
  void initState() {

    super.initState();

    db = widget.database;

    final repo = AppRepositoryImpl(
      db: db,
    );

    vm = AddViewModel(
      repo: repo,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Новая задача",
        ),
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(

              controller: _controller,

              decoration:
                  InputDecoration(

                hintText:
                    "Введите название задачи",

                filled: true,

                fillColor: Colors.white,

                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,

              height: 50,

              child: ElevatedButton(

                style:
                    ElevatedButton.styleFrom(

                  backgroundColor:
                      const Color(
                    0xFF007AFF,
                  ),
                ),

                onPressed: _saveTodo,

                child: const Text(

                  "Сохранить",

                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveTodo() {

    final todo = Todo(

      id: DateTime.now()
          .millisecondsSinceEpoch,

      title: _controller.text,

      isDone: false,

      createdAt:
          DateTime.now().toString(),
    );

    vm.addTodo(todo);

    Navigator.pop(context);
  }
}