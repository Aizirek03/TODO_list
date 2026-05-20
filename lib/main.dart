import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_05flu/home/home_page.dart';
import 'package:todo_list_05flu/onboarding/onboarding_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final prefs =
      await SharedPreferences.getInstance();

  final bool isViewed =
      prefs.getBool("isOnboardingViewed") ?? false;

  runApp(
    MyApp(
      isOnboardingViewed: isViewed,
    ),
  );
}

class MyApp extends StatelessWidget {

  final bool isOnboardingViewed;

  const MyApp({
    super.key,
    required this.isOnboardingViewed,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color(0xFFF2F2F7),
      ),

      home: isOnboardingViewed

          ? const MyHomePage(
              title: "Мои задачи",
            )

          : const OnboardingPage(),
    );
  }
}