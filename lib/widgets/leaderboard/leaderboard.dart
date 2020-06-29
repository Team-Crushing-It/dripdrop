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

  @override
  Widget build(BuildContext context) {
    print("hitherebuckeroo");
    return Scaffold(
       backgroundColor: Theme.of(context).backgroundColor,
      
        body: new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('leaderboard')
          .orderBy('score')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document['name']),
              subtitle: new Text('${document['score']} points'),
            );
          }).toList(),
        );
      },
    ));
  }
}
