import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_05flu/home/home_page.dart';

class OnboardingPage extends StatefulWidget {

  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() =>
      _OnboardingPageState();
}

class _OnboardingPageState
    extends State<OnboardingPage> {

  @override
  void initState() {
    super.initState();

    _saveOnboardingStatus();
  }

  Future<void> _saveOnboardingStatus() async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool(
      "isOnboardingViewed",
      true,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.task_alt,
              size: 120,
              color: Colors.blue,
            ),

            const SizedBox(height: 30),

            const Text(
              "Добро пожаловать\nв Todo App",

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Планируйте задачи,\nотмечайте выполненные дела\nи управляйте временем",

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 50),

            SizedBox(

              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),

                onPressed: _openHomePage,

                child: const Text(
                  "Начать",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openHomePage() {

    Navigator.pushReplacement(

      context,

      MaterialPageRoute(

        builder: (_) => const MyHomePage(
          title: "Мои задачи",
        ),
      ),
    );
  }
}