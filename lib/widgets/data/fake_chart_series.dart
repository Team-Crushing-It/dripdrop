class FakeChartSeries {
  Map<DateTime, double> createLineData(double factor) {
    Map<DateTime, double> data = {};
    for (int c = 50; c > 0; c--) {
      data[DateTime.now().subtract(Duration(minutes: c))] =
          c.toDouble() * factor;
    }
    return data;
  }

  Map<DateTime, double> createLineAlmostSaveValues() {
    Map<DateTime, double> data = {};
    data[DateTime.now().subtract(Duration(minutes: 40))] = 5.0;
    data[DateTime.now().subtract(Duration(minutes: 30))] = 35.0;
    data[DateTime.now().subtract(Duration(minutes: 22))] = 23.0;
    data[DateTime.now().subtract(Duration(minutes: 20))] = 21.9;
    data[DateTime.now().subtract(Duration(minutes: 15))] = 10.0;
    data[DateTime.now().subtract(Duration(minutes: 12))] = 15.0;
    data[DateTime.now().subtract(Duration(minutes: 5))] = 42.0;

    return data;
  }
}
