import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class RealtimeDash extends StatefulWidget {
  @override
  _RealtimeDashState createState() => _RealtimeDashState();
}

class _RealtimeDashState extends State<RealtimeDash> {
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //insert streambuilder here
          Container(width: 140, height: 80, color: Colors.blue),
          Container(width: 140, height: 80, color: Colors.yellow),
        ],
      ),
    );
    //Insert goodies h
  }
}
