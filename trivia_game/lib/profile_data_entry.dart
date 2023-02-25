import 'package:flutter/material.dart';
import 'package:trivia_game/profile_data.dart';

import 'homepage.dart';

class ProfileDataEntry extends StatefulWidget {
  const ProfileDataEntry({super.key});

  @override
  State<ProfileDataEntry> createState() => _ProfileDataEntryState();
}

class _ProfileDataEntryState extends State<ProfileDataEntry> {
  final myController = TextEditingController();

  var userName = '';

  void saveForm() {
    userName = myController.text;
    print("Username: $userName");
    ProfileData().setName(userName);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
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
              'Enter your name',
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
              onPressed: () => saveForm(), child: const Text("Save")),
        ],
      ),
    );
  }
}