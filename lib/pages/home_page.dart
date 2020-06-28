import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dripdrop/pages/data_page.dart';
import 'package:dripdrop/pages/dashboard_page.dart';
import 'package:dripdrop/pages/leaderboard_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller =
      PageController(initialPage: 1, viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
