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
                      child: ThirdPage()));
            },
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String title;

  const SecondPage({Key key, this.title}) : super(key: key);
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
            TimeSelect(),
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
            TimeSelect(),
            Graph(),
            MonthlyUsage(),
            RealtimeData(),
          ],
        ));
  }
}
