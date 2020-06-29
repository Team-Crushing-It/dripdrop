import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';


class MonthlyUsage extends StatefulWidget {
  @override
  _MonthlyUsageState createState() => _MonthlyUsageState();
}

class _MonthlyUsageState extends State<MonthlyUsage> {
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: FractionallySizedBox(
            heightFactor: 1.2,
            child:Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                // width: 290,
                height: 200,
                //Insert goodies here
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("monthly usage",
                        style: TextStyle(
                            fontFamily: "Nasalization",
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 10)),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontFamily: "Software Tester 7",
                                color: Theme.of(context).accentColor),
                            children: [
                          TextSpan(
                              text: "24352", style: TextStyle(fontSize: 50)),
                          TextSpan(text: "L/m", style: TextStyle(fontSize: 35))
                        ]))
                  ],
                ),
              ),
            ));
  }
}
