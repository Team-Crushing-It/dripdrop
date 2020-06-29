import 'package:flutter/material.dart';

class LeaderboardItem extends StatelessWidget {
  final String rank;
  final String score;
  final String name;
  final Color color;

  const LeaderboardItem({this.name, this.rank, this.score, this.color});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(rank, style: TextStyle(fontFamily: "Wheaton", fontSize: 25, color: color),),
        Text(score, style: TextStyle(fontFamily: "Wheaton", fontSize: 25, color: color),),
        Text(name, style: TextStyle(fontFamily: "Wheaton", fontSize: 25, color: color),)
      ],
    );
  }
}
