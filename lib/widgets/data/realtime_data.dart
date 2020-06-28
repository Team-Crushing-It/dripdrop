import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RealtimeData extends StatefulWidget {
  @override
  _RealtimeDataState createState() => _RealtimeDataState();
}

class _RealtimeDataState extends State<RealtimeData> {
  final databaseReference = Firestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //insert streambuilder here
        Container(width: 140, height: 80, color: Colors.blue),
        Container(width: 140, height: 80, color: Colors.yellow),
      ],
    );
    //Insert goodies h
  }
}
