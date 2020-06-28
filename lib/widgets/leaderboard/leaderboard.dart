import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final databaseReference = Firestore.instance;
  List<String> leaderboardNames = [];
  List<int> leaderboardScores = [];

  void findTopLeaders() {
    databaseReference
        .collection("leaderboard")
        .orderBy('score')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        Map<String, dynamic> codedLeaderBoardData = f.data;
        leaderboardNames.add(codedLeaderBoardData["name"]);
        leaderboardScores.add(codedLeaderBoardData["score"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("hitherebuckeroo");
    findTopLeaders();
    print(leaderboardNames);
    print(leaderboardScores);

    return Center(
        child: Container(
      margin: const EdgeInsets.only(top: 10.0),
      width: 250,
      height: 600,
      color: Colors.blue,
      //Insert goodies here
      child: null,
    ));
  }
}
