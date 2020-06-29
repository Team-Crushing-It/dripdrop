import 'package:flutter/material.dart';
import 'package:dripdrop/widgets/leaderboard/leaderboard2.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text("USER LEADERBOARD", style: Theme.of(context).textTheme.headline6)
          ),
          Leaderboard(),
        ],
      ),
    );
  }
}
