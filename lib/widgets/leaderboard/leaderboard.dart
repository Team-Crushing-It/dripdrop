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
