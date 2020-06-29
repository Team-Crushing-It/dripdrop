import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0.0),
          color: Colors.cyanAccent,
          width: 80.0,
          height: 80.0,
        ),
        Container(
          padding: const EdgeInsets.all(0.0),
          color: Colors.blueAccent,
          width: 80.0,
          height: 80.0,
        ),
        Container(
          padding: const EdgeInsets.all(0.0),
          color: Colors.orangeAccent,
          width: 80.0,
          height: 80.0,
        ),
      ],
    );
  }
}
