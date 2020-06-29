import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: 250,
          height: 70,
          color: Colors.purple,
          //Insert goodies here
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          width: 250,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: Theme.of(context).accentColor,
                width: 5,
              )),
          //Insert goodies here
          child: Text(
            "Your usage increased by 12% this month, exceeding the local average by 2234 L",
            style: TextStyle(fontFamily: "Nasalization", color: Theme.of(context).accentColor),
          ),
        ),
      ],
    ));
  }
}
