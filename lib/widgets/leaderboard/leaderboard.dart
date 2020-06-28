import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.topRight,
          child: Text("USAGE LEADERBOARD", style: TextStyle(fontFamily: "Software Tester 7", fontWeight: FontWeight.w700, fontSize: 30),),
          color: Theme.of(context).accentColor,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
              color: Theme.of(context).accentColor
            )
          ),
          child: ListView(
            children: [],
          ),
        )
      ],
    );
  }
}
