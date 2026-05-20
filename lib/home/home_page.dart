import 'package:flutter/material.dart';
import 'package:todo_list_05flu/add/add_page.dart';
import 'package:todo_list_05flu/database/todo.dart';
import 'package:todo_list_05flu/details/details_page.dart';
import 'package:todo_list_05flu/settings/settings_page.dart';


class MyHomePage extends StatefulWidget {

  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Todo> todoList = [

    Todo(
      id: 1,
      title: "Сделать домашнее задание",
      isDone: false,
      createdAt: "14:03:28",
    ),

    Todo(
      id: 2,
      title: "Сделать домашнее задание",
      isDone: true,
      createdAt: "14:03:28",
    ),

    Todo(
      id: 3,
      title: "Сделать домашнее задание",
      isDone: false,
      createdAt: "14:03:28",
    ),

    Todo(
      id: 4,
      title: "Сделать домашнее задание",
      isDone: false,
      createdAt: "14:03:28",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
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
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: ListView.builder(

          itemCount: todoList.length,

          itemBuilder: (context, index) {

            final todo = todoList[index];

            return GestureDetector(

              onTap: () {
                _openDetails(todo);
              },

              child: Container(

                margin: const EdgeInsets.only(bottom: 12),

                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFF007AFF),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Row(

                  children: [

                    GestureDetector(

                      onTap: () {

                        setState(() {

                          todo.isDone = !todo.isDone;

                        });

                      },

                      child: Container(

                        width: 22,
                        height: 22,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),

                        child: todo.isDone
                            ? const Icon(
                                Icons.check,
                                size: 18,
                              )
                            : null,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(

                      child: Text(

                        todo.title,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    Text(
                      todo.createdAt,

                      style: const TextStyle(
                        color: Colors.white70,
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
        padding: const EdgeInsets.all(16),

        child: SizedBox(

          height: 50,

          child: ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF007AFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            onPressed: _navigateToAddPage,

            child: const Text(
              "+ Добавить задачу",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToAddPage() async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddPage(),
      ),
    );

    if (result != null) {

      setState(() {

        todoList.add(

          Todo(
            id: todoList.length + 1,
            title: result,
            isDone: false,
            createdAt: "14:03:28",
          ),
        );
      });
    }
  }

  void _openDetails(Todo todo) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailsPage(todo: todo),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  void _openSettings() {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SettingsPage(),
      ),
    );
  }
}