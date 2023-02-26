import 'package:flutter/material.dart';
import 'package:trivia_game/api/preferences.dart';
import 'package:trivia_game/profile_data_entry.dart';

import 'homepage.dart';

// TODO: add functionality to get and display high scores

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future<String> name = Preferences().getName();
  String userName = await name;

  runApp(MyApp(userName: userName));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: userName.isEmpty
          ? const ProfileDataEntry()
          : HomePage(userName: userName),
    );
  }
}
