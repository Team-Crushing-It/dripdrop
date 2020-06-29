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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          color: Theme.of(context).accentColor,
          child: Text("USAGE LEADERBOARD", style: TextStyle(fontFamily: "Software Tester 7", fontSize: 30),),
        ),
        Container(
          color: Theme.of(context).backgroundColor,
          child: new StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('leaderboard').orderBy('score').limit(10).snapshots(),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (!snapshot.hasData) return new Text('Loading...');
              currentScore = 0;

              return Container(
                padding: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).accentColor, width: 5),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          child: Text(
                            "RANK",
                            style: TextStyle(fontFamily: "Wheaton", fontSize: 23, color: Color(0xFFdbf24a)),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: 40.0,
                          child: Text(
                            "NAME",
                            style: TextStyle(fontFamily: "Wheaton", fontSize: 23, color: Color(0xFFdbf24a)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 40.0,
                          child: Text(
                            "SCORE",
                            style: TextStyle(fontFamily: "Wheaton", fontSize: 23, color: Color(0xFFdbf24a)),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    new Column(
                      children: snapshot.data.documents.map((DocumentSnapshot document) {
                        addit();
                        return new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 40.0,
                              child: Text(
                                currentScore.toString(),
                                style: TextStyle(fontFamily: "Wheaton", fontSize: 23, color: _getColor(currentScore)),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              height: 40.0,
                              child: Text(
                                document['name'],
                                style: TextStyle(fontFamily: "Wheaton", fontSize: 23, color: _getColor(currentScore)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              height: 40.0,
                              child: Text(
                                document['score'].toString(),
                                style: TextStyle(fontFamily: "Wheaton", fontSize: 23, color: _getColor(currentScore)),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void addit() {
    currentScore += 1;
  }
}

//title: new Text(document['name']),
//subtitle: new Text('${document['score']} points'),

Color _getColor(int index) {
  if (index == 1) {
    return Color(0xFFFFFFFF);
  }
  if (index == 2) {
    return Color(0xFFeb5757);
  }
  if (index == 3) {
    return Color(0xFFf39a4a);
  }
  if (index == 4) {
    return Color(0xFFf2c94d);
  }
  if (index == 5) {
    return Color(0xFFf2c94d);
  }
  if (index == 6) {
    return Color(0xFFf2c94d);
  }
  if (index == 7) {
    return Color(0xFF70cf97);
  }
  if (index == 8) {
    return Color(0xFF27ae61);
  }
  if (index == 9) {
    return Color(0xFF219652);
  }
  if (index == 10) {
    return Color(0xFF2c9cdb);
  }
}
