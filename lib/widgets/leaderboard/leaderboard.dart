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
    return Container(
      color: Theme.of(context).backgroundColor,
      child: new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('leaderboard').orderBy('score').snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (!snapshot.hasData) return new Text('Loading...');
          currentScore = 0;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).accentColor, width: 5),
            ),
            child: new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                addit();
                return new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      color: Colors.cyanAccent,
                      width: 90.0,
                      height: 80.0,
                      child: Text(
                        currentScore.toString(),
                        style: TextStyle(fontFamily: "Wheaton", fontSize: 23),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      color: Colors.blueAccent,
                      width: 90.0,
                      height: 80.0,
                      child: Text(
                        document['name'],
                        style: TextStyle(fontFamily: "Wheaton", fontSize: 23),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      color: Colors.orangeAccent,
                      width: 90.0,
                      height: 80.0,
                      child: Text(
                        document['score'].toString(),
                        style: TextStyle(fontFamily: "Wheaton", fontSize: 23),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  void addit() {
    currentScore += 1;
  }
}

//title: new Text(document['name']),
//subtitle: new Text('${document['score']} points'),

RichText _recolorRankText(String text) {
  var words = text.split("\n");
  return RichText(
    text: TextSpan(style: TextStyle(fontFamily: "Wheaton", fontSize: 23), children: [
      TextSpan(text: "RANK", style: TextStyle(color: Color(0xFFdbf24a))),
      TextSpan(text: words[0], style: TextStyle(color: Color(0xFFFFFFFF))),
      TextSpan(text: words[1], style: TextStyle(color: Color(0xFFeb5757))),
      TextSpan(text: words[2], style: TextStyle(color: Color(0xFFf39a4a))),
      TextSpan(text: words[3], style: TextStyle(color: Color(0xFFf2c94d))),
      TextSpan(text: words[4], style: TextStyle(color: Color(0xFFf2c94d))),
      TextSpan(text: words[5], style: TextStyle(color: Color(0xFFf2c94d))),
      TextSpan(text: words[6], style: TextStyle(color: Color(0xFF70cf97))),
      TextSpan(text: words[7], style: TextStyle(color: Color(0xFF27ae61))),
      TextSpan(text: words[8], style: TextStyle(color: Color(0xFF219652))),
      TextSpan(text: words[9], style: TextStyle(color: Color(0xFF2c9cdb))),
      TextSpan(text: words[10], style: TextStyle(color: Color(0xFFdbf24a))),
      TextSpan(text: words[11], style: TextStyle(color: Color(0xFFdbf24a))),
    ]),
  );
}
