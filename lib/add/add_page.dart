import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {

  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  final TextEditingController _controller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Новая задача"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(

              controller: _controller,

              decoration: InputDecoration(

                hintText: "Введите название задачи",

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

    Navigator.pop(
      context,
      _controller.text,
    );
  }
}