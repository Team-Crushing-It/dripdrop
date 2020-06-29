import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dripdrop/pages/data_page.dart';
import 'package:dripdrop/pages/dashboard_page.dart';
import 'package:dripdrop/pages/leaderboard_page.dart';
import '../globals.dart' as globals;

import 'package:flutter/services.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final databaseReference = Firestore.instance;

class _HomePageState extends State<HomePage> {
  PageController _controller = PageController(initialPage: 1, viewportFraction: 0.8);


  @override
  void initState() {
    super.initState();
    print("yo");

    databaseReference
        .collection("waterUsage")
        .orderBy('date')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        int a = f.data["waterused"];
        globals.tempUsageNumbers.add(a);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
      child: PageView(
        controller: _controller,
        children: [
          DataPage(),
          DashboardPage(),
          LeaderboardPage(),
        ],
      ),
    ));
  }
}
