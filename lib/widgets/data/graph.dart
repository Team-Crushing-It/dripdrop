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

final databaseReference = Firestore.instance;
var temperatureValue, ecValue, tdsValue, phValue;
List<int> usageNumbers;
List<Timestamp> usageDates;

class _GraphState extends State<Graph> {
  List<Color> gradientColors = [Color(0xFF0DA2CA)];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    print(globals.tempUsageNumbers);
    usageNumbers = globals.tempUsageNumbers;

    return Flexible(
        flex: 5,
        fit: FlexFit.tight,
        child: FractionallySizedBox(
            heightFactor: 1,
            child: Center(
                child: Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: 270,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF0DA2CA), width: 7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Color(0xFF1D1D1D)),
                  margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  padding: new EdgeInsets.only(
                      bottom: 10.0, left: 0.0, right: 15.0, top: 30.0),
                  child: LineChart(
                    showAvg ? avgData() : mainData(),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 34,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        showAvg = !showAvg;
                      });
                    },
                    child: Container(),
                    // Text(
                    //   'avg',
                    //   style: TextStyle(
                    //       fontSize: 12,
                    //       color:
                    //           showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
                    // ),
                  ),
                ),
              ],
            ))));
  }

  LineChartData mainData() {
    return LineChartData(
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
          reservedSize: 22,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 8),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '                     ';
              case 5:
                return 'JUN 3';
              case 8:
                return '                     ';
              case 11:
                return '                     ';
              case 14:
                return 'JUN 11';
              case 17:
                return '                     ';
              case 20:
                return '                     ';
              case 23:
                return 'JUN 19';
            }
            return '';
          },
          margin: 8,
        ),

        //Horizontal styling =======================================
        rightTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '150L';
              case 3:
                return '                     ';
              case 5:
                return '300L';
              case 7:
                return '                     ';
              case 9:
                return '450L';
              case 11:
                return '                     ';
              case 13:
                return '600L';
              case 15:
                return '                     ';
              case 17:
                return '750L';
              case 19:
                return '                     ';
            }
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),

      minX: 0,
      maxX: 30,
      minY: 0,
      maxY: 20,

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
    );
  }

//============================================================================
  LineChartData avgData() {
    var lengthOfUsageNumbers = 30;
    var xIntervalsHere = 31 / 11;
    var varAverage = usageNumbers.reduce((a, b) => a + b);
    var finalAverage = varAverage / lengthOfUsageNumbers;
    print(lengthOfUsageNumbers);
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 13),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'JUN 3';
              case 5:
                return 'JUN 11';
              case 8:
                return 'JUN 19';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '150L';
              case 3:
                return '                     ';
              case 5:
                return '300L';
              case 7:
                return '                     ';
              case 9:
                return '450L';
              case 11:
                return '                     ';
              case 13:
                return '600L';
              case 15:
                return '                     ';
              case 17:
                return '750L';
              case 19:
                return '                     ';
            }
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 20,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, finalAverage / 50),
            FlSpot(2.6, finalAverage / 50),
            FlSpot(4.9, finalAverage / 50),
            FlSpot(6.8, finalAverage / 50),
            FlSpot(8, finalAverage / 50),
            FlSpot(9.5, finalAverage / 50),
            FlSpot(11, finalAverage / 50),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
