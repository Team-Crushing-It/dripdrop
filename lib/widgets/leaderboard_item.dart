import 'package:flutter/material.dart';

class LeaderboardItem extends StatelessWidget {
  final String rank;
  final int score;
  final String name;
  const LeaderboardItem({this.name, this.rank, this.score});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rank),
        Text("$score"),
        Text(name)
      ],
    );
  }
}
