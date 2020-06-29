import 'package:flutter/material.dart';

class Twitter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: 250,
        height: 200,
        //Insert goodies here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).accentColor,
              child: Text(
                "LOCAL NEWS",
                style: TextStyle(fontFamily: "Software Tester 7", fontSize: 30),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).accentColor, width: 5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text("TWITTER PLACEHOLDER", style: TextStyle(color: Theme.of(context).accentColor),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
