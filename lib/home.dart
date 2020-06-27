import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'fake_chart_series.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with FakeChartSeries {
  int chartIndex = 1;

  @override
  Widget build(BuildContext context) {
    LineChart chart;

    chart = LineChart.fromDateTimeMaps(
        [createLineAlmostSaveValues()], [Colors.green], ['C'],
        tapTextFontWeight: FontWeight.w400);

    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
      ),
      body: Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedLineChart(
                  chart,
                  key: UniqueKey(),
                ), //Unique key to force animations
              )),
              SizedBox(width: 200, height: 50, child: Text('')),
            ]),
      ),
    );
  }
}
