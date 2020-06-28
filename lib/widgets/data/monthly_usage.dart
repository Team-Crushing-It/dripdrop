import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MonthlyUsage extends StatefulWidget {
  @override
  _MonthlyUsageState createState() => _MonthlyUsageState();
}

class _MonthlyUsageState extends State<MonthlyUsage> {
final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: const EdgeInsets.only(top: 10.0, bottom:10.0),
      width: 250,
      height: 130,
      color: Colors.red,
      //Insert goodies here
      child: null,
    ));
  }
}
