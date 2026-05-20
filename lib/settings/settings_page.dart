import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState
    extends State<SettingsPage> {

  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: isDarkTheme
          ? const Color(0xFF171526)
          : const Color(0xFFF2F2F7),

      appBar: AppBar(

        backgroundColor: isDarkTheme
            ? const Color(0xFF171526)
            : const Color(0xFFF2F2F7),

        title: Text(
          "Настройки",

          style: TextStyle(
            color: isDarkTheme
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Container(

          padding: const EdgeInsets.all(14),

          decoration: BoxDecoration(

            color: isDarkTheme
                ? const Color(0xFF26233A)
                : Colors.white,

            borderRadius: BorderRadius.circular(12),
          ),

          child: Row(

            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Тёмная тема",

                    style: TextStyle(
                      color: isDarkTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),

                  Text(
                    "Использовать тёмное\nоформление приложения",

                    style: TextStyle(
                      fontSize: 11,

                      color: isDarkTheme
                          ? Colors.white70
                          : Colors.black54,
                    ),
                  ),
                ],
              ),

              Switch(

                value: isDarkTheme,

                onChanged: (value) {

                  setState(() {

                    isDarkTheme = value;

                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}