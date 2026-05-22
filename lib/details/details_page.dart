import 'package:flutter/material.dart';
import 'package:todo_list_05flu/database/app_database.dart';
import 'package:todo_list_05flu/database/app_repository.dart';
import 'package:todo_list_05flu/database/todo.dart';
import 'package:todo_list_05flu/details/details_viwe_model.dart';

class DetailsPage extends StatefulWidget {

  final Todo todo;
  final int index;
  final AppDatabase database;

  const DetailsPage({
    super.key,
    required this.todo,
    required this.index,
    required this.database,
  });

  @override
  State<DetailsPage> createState() =>
      _DetailsPageState();
}

class _DetailsPageState
    extends State<DetailsPage> {

  late TextEditingController _controller;
  late DetailsViewModel vm;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.todo.title,
    );

    final repo = AppRepositoryImpl(
      db: widget.database,
    );

    vm = DetailsViewModel(
      repo: repo,
    );
  }

  @override
  void dispose() {

    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF2F2F7),

      appBar: AppBar(

        backgroundColor:
            const Color(0xFFF2F2F7),

        elevation: 0,

        leading: IconButton(

          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: Text(

          widget.todo.title,

          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),

        centerTitle: true,

        actions: [

          IconButton(

            onPressed: _deleteTodo,

            icon: const Icon(
              Icons.delete,
              color: Colors.blue,
            ),
          ),
        ],
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(

              controller: _controller,

              maxLines: 2,

              decoration:
                  InputDecoration(

                filled: true,

                fillColor:
                    Colors.white,

                contentPadding:
                    const EdgeInsets.all(
                      16,
                    ),

                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                        16,
                      ),

                  borderSide:
                      const BorderSide(
                    color:
                        Colors.grey,
                  ),
                ),

                enabledBorder:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                        16,
                      ),

                  borderSide:
                      const BorderSide(
                    color:
                        Colors.grey,
                  ),
                ),

                focusedBorder:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                        16,
                      ),

                  borderSide:
                      const BorderSide(
                    color:
                        Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(

              width:
                  double.infinity,

              height: 55,

              child:
                  ElevatedButton(

                style:
                    ElevatedButton
                        .styleFrom(

                  backgroundColor:
                      const Color(
                    0xFF007AFF,
                  ),

                  shape:
                      RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius
                            .circular(
                      14,
                    ),
                  ),
                ),

                onPressed:
                    _saveTodo,

                child: const Text(

                  "Сохранить изменения",

                  style: TextStyle(

                    color:
                        Colors.white,

                    fontSize: 16,

                    fontWeight:
                        FontWeight.w500,
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

    final updatedTodo = Todo(

      id: widget.todo.id,

      title: _controller.text,

      isDone:
          widget.todo.isDone,

      createdAt:
          widget.todo.createdAt,
    );

    vm.updateTodo(
      widget.index,
      updatedTodo,
    );

    Navigator.pop(context);
  }

  void _deleteTodo() {

    vm.deleteTodo(
      widget.index,
    );

    Navigator.pop(context);
  }
}