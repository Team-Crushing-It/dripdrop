// You may want to put this directly into graph.dart=============================

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class TimeSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        fit: FlexFit.loose,
        child: FractionallySizedBox(
            heightFactor: .8,
            widthFactor: .6,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                      width: 7,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.only(top: 10.0),
                // width: 175,
                // height: 75,
                //Insert goodies here
                child: FractionallySizedBox(
                  heightFactor: .9,
                  widthFactor: .98,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Theme.of(context).accentColor),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: AutoSizeText(
                        "MONTH",
                        style: TextStyle(
                            fontFamily: "Software Tester 7", fontSize: 40),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
