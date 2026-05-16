import 'package:flutter/material.dart';
import 'package:todolist/database/todo.dart';

class DetailsPage extends StatefulWidget {

  final Todo todo;

  const DetailsPage({
    super.key,
    required this.todo,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.todo.title,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(widget.todo.title),

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
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(

              controller: _controller,

              onChanged: (value) {

                widget.todo.title = value;

                setState(() {});
              },

              decoration: InputDecoration(

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,
              height: 50,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text(
                  "Сохранить изменения",
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

  void _deleteTodo() {

    Navigator.pop(context);
  }
}