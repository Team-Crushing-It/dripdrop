import 'package:flutter/material.dart';
import 'package:dripdrop/widgets/dash/dash.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Profile(),
          Alert(),
          Twitter(),
          RealtimeDash(),
        ],
      
    );
  }
}
