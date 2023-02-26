import 'package:flutter/material.dart';
import 'api/httphelper.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  _LeaderboardState() {
    getleaderboard();
  }
  Future<List>? _leaderboard;
  List _leaderboardList = [];

  void getleaderboard() async {
    _leaderboard = HTTPHelper().fetchLeaderBoard();
    _leaderboardList = await _leaderboard!;
    print("Leaderboard valmis");
    print(_leaderboardList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: _leaderboardList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(_leaderboardList[index]['userName']),
                            subtitle: Text(
                                "Score: ${_leaderboardList[index]['score']} Category: ${_leaderboardList[index]['category']}",
                                style: const TextStyle(
                                  color: Colors.black,
                                )),
                          );
                        },
                      ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
