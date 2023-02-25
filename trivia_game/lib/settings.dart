import 'package:flutter/material.dart';
import 'package:trivia_game/profile_data.dart';

import 'homepage.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final myController = TextEditingController();

  var userName = '';

  void saveForm() {
    userName = myController.text;
    print("Username: $userName");
    ProfileData().setName(userName);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(userName: userName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Data Entry'),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Change your name',
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          TextFormField(
            controller: myController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          ElevatedButton(
              onPressed: () => {
                    saveForm(),
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Saved')),
                    ),
                  },
              child: const Text("Save")),
        ],
      ),
    );
  }
}
