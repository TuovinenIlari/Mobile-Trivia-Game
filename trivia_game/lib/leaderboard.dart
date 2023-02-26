import 'package:flutter/material.dart';
import 'api/httphelper.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  Future<List>? _leaderboard;
  List _leaderboardList = [];

  void get leaderboard async {
    _leaderboard = HTTPHelper().fetchLeaderBoard();
    _leaderboardList = await _leaderboard!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: Column(
        children: [
          const Text('Leaderboard'),
          FutureBuilder(
            future: _leaderboard,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: _leaderboardList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_leaderboardList[index]['name']),
                      subtitle: Text(_leaderboardList[index]['score'] +
                          _leaderboardList[index]['category']),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
