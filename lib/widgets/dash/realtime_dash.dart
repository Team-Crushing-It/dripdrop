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
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: FractionallySizedBox(
            heightFactor: 1.2,
            child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //insert streambuilder here
                            Container(
                              width: 140,
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:100,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 3),
                                    child: Text("pH",
                                        style: TextStyle(
                                            fontFamily: "Nasalization",
                                            fontSize: 13)),
                                    color: Theme.of(context).accentColor,
                                  ),
                                  Container(
                                    width:120,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("8",
                                            style: TextStyle(
                                                fontFamily: "Software Tester 7",
                                                fontSize: 40)),
                                        Text("pH",
                                            style: TextStyle(
                                                fontFamily: "Software Tester 7",
                                                fontSize: 25))
                                      ],
                                    ),
                                    color: Theme.of(context).splashColor,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:100,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 3),
                                    child: Text("temp",
                                        style: TextStyle(
                                            fontFamily: "Nasalization",
                                            fontSize: 13)),
                                    color: Theme.of(context).accentColor,
                                  ),
                                  Container(
                                    width:120,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("30",
                                            style: TextStyle(
                                                fontFamily: "Software Tester 7",
                                                fontSize: 40)),
                                        Text("°C",
                                            style: TextStyle(
                                                fontFamily: "Software Tester 7",
                                                fontSize: 25))
                                      ],
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3),
                                    color: Theme.of(context).splashColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ]))));
    //Insert goodies h
  }
}
