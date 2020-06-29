import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: 250,
        height: 75,
        //Insert goodies here
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Theme.of(context).accentColor
                ),
                child: Icon(Icons.person, size: 50),
              ),
            ),
            Container(
              child: Text("TCI", style: TextStyle(fontFamily: "Software Tester 7", fontSize: 40),),
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
