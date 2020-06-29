import 'package:flutter/material.dart';
import 'package:dripdrop/widgets/data/data.dart';
import 'package:dripdrop/widgets/data/graphWeek.dart';

class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TimeSelect(),
          //Graph(),
          GraphWeek(),
          MonthlyUsage(),
          RealtimeData(),
        ],
      ),
    );
  }
}
