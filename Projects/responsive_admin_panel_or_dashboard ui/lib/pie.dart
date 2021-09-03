import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class pie extends StatefulWidget {
  const pie({Key? key}) : super(key: key);

  @override
  _pieState createState() => _pieState();
}

class _pieState extends State<pie> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  void xd() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  void initState() {
    xd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1F2C),
      appBar: AppBar(
        backgroundColor: Color(0xff1E1F2C),
        title: Text("Storage Details"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: SfCircularChart(
                legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                tooltipBehavior: _tooltipBehavior,
                series: <CircularSeries>[
                  PieSeries<GDPData, String>(
                      dataSource: _chartData,
                      xValueMapper: (GDPData data, _) => data.contient,
                      yValueMapper: (GDPData data, _) => data.gdp,
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(color: Colors.white)),
                      enableTooltip: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Document File", 4000),
      GDPData("Media Files", 1200),
      GDPData("Other Files", 400),
      GDPData("Unkown", 210),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.contient, this.gdp);
  final String contient;
  final int gdp;
}
