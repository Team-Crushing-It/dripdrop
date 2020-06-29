import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dripdrop/widgets/data/fake_chart_series.dart';
import '../../globals.dart' as globals;

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<Color> gradientColors = [Color(0xFF0DA2CA)];
  final databaseReference = Firestore.instance;
  var temperatureValue, ecValue, tdsValue, phValue;
  List<int> usageNumbers;
  List<Timestamp> usageDates;

  bool showAvg = false;

  @override
  void initState() {
    super.initState();

    usageNumbers = globals.tempUsageNumbers;

  }

  @override
  Widget build(BuildContext context) {


    return Flexible(
          flex: 5,
          child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF0DA2CA), width: 7),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: Color(0xFF1D1D1D)),
          margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
          padding: new EdgeInsets.only(
              bottom: 10.0, left: 0.0, right: 15.0, top: 30.0),
          child:  LineChart(LineChartData(
        lineTouchData: LineTouchData(enabled: true),

        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          drawHorizontalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        // Bottom formatting styles ============================================
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 2,
            textStyle: const TextStyle(
                color: Color(0xff68737d),
                fontWeight: FontWeight.bold,
                fontSize: 8),
            getTitles: (value) {
              switch (value.toInt()) {
                case 2:
                  return '';
              }
              return '';
            },
            margin: 8,
          ),

          //Horizontal styling =======================================
          leftTitles: SideTitles(
            showTitles: true,
            textStyle: const TextStyle(
              color: Color(0xff67727d),
              fontWeight: FontWeight.bold,
              fontSize: 8,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return '';
              }
              return '';
            },
            reservedSize: 5,
            margin: 2,
          ),
        ),
        borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff37434d), width: 1)),

        minX: 0,
        maxX: 30,
        minY: 0,
        maxY: 30,

        //data time ========================================================
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (var i = 0; i < 31; i++)
                FlSpot(i + (11 / 31) / 100, usageNumbers[i] / 50),

              //FlSpot(0, 3),
              //FlSpot(2.6, 2),
              //FlSpot(4.9, 5),
              //FlSpot(6.8, 3.1),
              //FlSpot(8, 4),
              //FlSpot(9.5, 3),
              //FlSpot(11, 4),
            ],
            isCurved: true,
            colors: gradientColors,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              colors:
                  gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            ),
          ),
        ],
      )
        )),
    );

  }}