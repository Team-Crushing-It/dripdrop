import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';



class SelectPage extends StatelessWidget {
  final String title;

  const SelectPage({Key key, this.title}) : super(key: key);
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
              //   Navigator.push(
              //       context,
              //       PageTransition(
              //           curve: Curves.linear,
              //           type: PageTransitionType.upToDown,
              //           child: SecondPage()));
               },
            ),
            RaisedButton(
              child: Text('Monthly Graph'),
              onPressed: () {
              //   Navigator.push(
              //       context,
              //       PageTransition(
              //           curve: Curves.linear,
              //           type: PageTransitionType.upToDown,
              //           child: DataPage()));
              // },
              }),
          ],
        ));
  }
}