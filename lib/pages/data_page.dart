import 'package:flutter/material.dart';
import 'package:dripdrop/widgets/data/data.dart';
import 'package:dripdrop/widgets/data/graphWeek.dart';
import 'package:page_transition/page_transition.dart';

class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TimeSelectButton(),
            Graph(),
            MonthlyUsage(),
            RealtimeData(),
          ],
        ));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TimeSelectButton(),
            GraphWeek(),
            MonthlyUsage(),
            RealtimeData(),
          ],
        ));
  }
}

class ThirdPage extends StatelessWidget {
  final String title;

  const ThirdPage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(args ?? "Page Transition Plugin"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Weekly Graph'),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        curve: Curves.linear,
                        type: PageTransitionType.upToDown,
                        child: SecondPage()));
              },
            ),
            RaisedButton(
              child: Text('Monthly Graph'),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        curve: Curves.linear,
                        type: PageTransitionType.upToDown,
                        child: DataPage()));
              },
            ),
          ],
        ));
  }
}

class TimeSelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tapped");
        Navigator.push(
            context,
            PageTransition(
                curve: Curves.linear,
                type: PageTransitionType.upToDown,
                child: ThirdPage()));
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.only(top: 10.0),
        width: 175,
        height: 75,
        //Insert goodies here
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Theme.of(context).accentColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "MONTH",
              style: TextStyle(fontFamily: "Software Tester 7", fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
