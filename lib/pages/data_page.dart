import 'package:flutter/material.dart';
import 'package:dripdrop/widgets/data/data.dart';


class DataPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TimeSelect(),
          Graph(),
          MonthlyUsage(),
          RealtimeData(),
        ],
      ),
    );
  }
}
