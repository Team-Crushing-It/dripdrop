// You may want to put this directly into graph.dart=============================

import 'package:flutter/material.dart';

class TimeSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.only(top: 10.0),
        width: 175,
        height: 75,
        //Insert goodies here
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Theme.of(context).accentColor
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "MONTH",
              style: TextStyle(fontFamily: "Software Tester 7", fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
