import 'file:///D:/Projects/dripdrop/lib/widgets/leaderboard/leaderboard_item.dart';
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
        padding: const EdgeInsets.all(8),
        width: 250,
        height: 600,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
            width: 5
          )
        ),
        //Insert goodies here
        child: ListView(
          children: [
            LeaderboardItem(rank: "RANK", score: "SCORE", name: "NAME", color: Color(0xFFdbf24a),),
            LeaderboardItem(rank: "1st", score: "27843", name: "TCi", color: Color(0xFFf3f7ff),),
            LeaderboardItem(rank: "1st", score: "27843", name: "TCi", color: Color(0xFFeb5757),),
            LeaderboardItem(rank: "1st", score: "27843", name: "TCi", color: Color(0xFFf39a4a),),
            LeaderboardItem(rank: "1st", score: "27843", name: "TCi", color: Color(0xFFf2c94d),),
            LeaderboardItem(rank: "1st", score: "27843", name: "TCi", color: Color(0xFFf2c94d),),
            LeaderboardItem(rank: "1st", score: "27843", name: "TCi", color: Color(0xFFf2c94d),),
            LeaderboardItem(rank: "1st", score: "27843", name: "TCi", color: Color(0xFF70cf97),),
            LeaderboardItem(rank: "1st", score: "27843", name: "TCi", color: Color(0xFF219652),),
            LeaderboardItem(rank: "1st", score: "27843", name: "TCi", color: Color(0xFF2c9cdb),),
          ],
        ),
      ),
    );
  }
}
