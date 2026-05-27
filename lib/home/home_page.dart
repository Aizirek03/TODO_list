import 'package:flutter/material.dart';
import 'package:todo_list_05flu/add/add_page.dart';
import 'package:todo_list_05flu/database/app_database.dart';
import 'package:todo_list_05flu/database/app_repository.dart';
import 'package:todo_list_05flu/database/todo.dart';
import 'package:todo_list_05flu/details/details_page.dart';
import 'package:todo_list_05flu/home/home_view_model.dart';
import 'package:todo_list_05flu/settings/settings_page.dart';

class MyHomePage extends StatefulWidget {

  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState();
}

class _MyHomePageState
    extends State<MyHomePage> {

  late final AppDatabase db;

  late final HomeViewModel vm;

  @override
  void initState() {

    super.initState();

    db = AppDatabase();

    final repo = AppRepositoryImpl(
      db: db,
    );

    vm = HomeViewModel(
      repo: repo,
    );

    vm.getTodoList();
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

        centerTitle: true,

        title: Text(

          widget.title,

          style: const TextStyle(

            color: Colors.black,

            fontSize: 28,

            fontWeight:
                FontWeight.w500,
          ),
        ),

        actions: [

          IconButton(

            onPressed: _openSettings,

            icon: const Icon(

              Icons.settings,

              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Padding(

        padding:
            const EdgeInsets.symmetric(
          horizontal: 16,
        ),

        child: ListView.builder(

          itemCount: vm.todoList.length,

          itemBuilder: (
            context,
            index,
          ) {

            final todo =
                vm.todoList[index];

            return GestureDetector(

              onTap: () {

                _openDetails(
                  todo,
                  index,
                );
              },

              child: Container(

                margin:
                    const EdgeInsets.only(
                  bottom: 12,
                ),

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),

                decoration: BoxDecoration(

                  color:
                      const Color(
                    0xFF007AFF,
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    10,
                  ),
                ),

                child: Row(

                  children: [

                    GestureDetector(

                      onTap: () {

                        vm.updateTodoState(
                          index,
                          !todo.isDone,
                        );

                        setState(() {});
                      },

                      child: Container(

                        width: 22,

                        height: 22,

                        decoration:
                            BoxDecoration(

                          color: Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                            4,
                          ),
                        ),

                        child: todo.isDone

                            ? const Icon(
                                Icons.check,
                                size: 18,
                              )

                            : null,
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    Expanded(

                      child: Text(

                        todo.title,

                        style:
                            const TextStyle(

                          color:
                              Colors.white,

                          fontSize: 14,
                        ),
                      ),
                    ),

                    Text(

                      todo.createdAt,

                      style:
                          const TextStyle(

                        color:
                            Colors.white70,

                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: Padding(

        padding:
            const EdgeInsets.all(16),

        child: SizedBox(

          height: 55,

          child: ElevatedButton(

            style:
                ElevatedButton.styleFrom(

              backgroundColor:
                  const Color(
                0xFF007AFF,
              ),

              shape:
                  RoundedRectangleBorder(

                borderRadius:
                    BorderRadius.circular(
                  12,
                ),
              ),
            ),

            onPressed:
                _navigateToAddPage,

            child: const Text(

              "+ Добавить задачу",

              style: TextStyle(

                color: Colors.white,

                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToAddPage() async {

    await Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) => AddPage(
          database: db,
        ),
      ),
    );

    setState(() {

      vm.getTodoList();

    });
  }

  void _openDetails(
    Todo todo,
    int index,
  ) async {

    await Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) => DetailsPage(

          todo: todo,

          index: index,

          database: db,
        ),
      ),
    );

    setState(() {

      vm.getTodoList();

    });
  }

  void _openSettings() {

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) =>
            const SettingsPage(),
      ),
    );
  }
}