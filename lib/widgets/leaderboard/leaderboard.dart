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
  int currentScore = 0;
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
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) return new Text('Loading...');
            currentScore = 0;

            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                addit();
                return new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(0.0),
                        color: Colors.cyanAccent,
                        width: 80.0,
                        height: 80.0,
                        child: Text(currentScore.toString())),
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      color: Colors.blueAccent,
                      width: 80.0,
                      height: 80.0,
                      child: Text(document['name']),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      color: Colors.orangeAccent,
                      width: 80.0,
                      height: 80.0,
                      child: Text(document['score'].toString()),
                    ),
                  ],
                );
              }).toList(),
            );
          },
        ));
  }

  void addit() {
    currentScore += 1;
  }
}

//title: new Text(document['name']),
//subtitle: new Text('${document['score']} points'),
