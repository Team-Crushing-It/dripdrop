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
          Container(
            width: 160,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 3),
                  child: Text("total dissolved solids", style: TextStyle(fontFamily: "Nasalization", fontSize: 13)),
                  color: Theme.of(context).accentColor,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("252", style: TextStyle(fontFamily: "Software Tester 7", fontSize: 40)),
                      Text("mg/L", style: TextStyle(fontFamily: "Software Tester 7", fontSize: 25))
                    ],
                  ),
                  color: Theme.of(context).splashColor,
                  padding: EdgeInsets.symmetric(horizontal: 3),
                ),
              ],
            ),
          ),
          Container(
            width: 160,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 3),
                  child: Text("electrical conductivity", style: TextStyle(fontFamily: "Nasalization", fontSize: 13)),
                  color: Theme.of(context).accentColor,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("300", style: TextStyle(fontFamily: "Software Tester 7", fontSize: 40)),
                      Text("uS", style: TextStyle(fontFamily: "Software Tester 7", fontSize: 25))
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  color: Theme.of(context).splashColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //Insert goodies h
  }
}
