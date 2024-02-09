import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Activities',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
      ),
      body: const GradientBackground(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Your chart widget
              Expanded(
                child: CombinedBarLineChart(),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 200,
                    child: Card(
                      color: Color.fromRGBO(60, 13, 68, 1),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Text(
                          '20 Event created',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Card(
                      color: Color.fromRGBO(60, 13, 68, 1),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Text(
                          '60 Tickets Sold',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 200,
                    child: Card(
                      color: Color.fromRGBO(60, 13, 68, 1),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Text(
                          '40 Sales Achieved',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Card(
                      color: Color.fromRGBO(60, 13, 68, 1),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Text(
                          '80 Affiliated Income',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250,
              )
              // You can add additional info or widgets here related to the Activities screen
            ],
          ),
        ),
      ),
    );
  }
}

class CombinedBarLineChart extends StatefulWidget {
  const CombinedBarLineChart({Key? key}) : super(key: key);

  @override
  CombinedBarLineChartState createState() => CombinedBarLineChartState();
}

class CombinedBarLineChartState extends State<CombinedBarLineChart> {
  final List<BarChartGroupData> barGroups = [];
  final List<FlSpot> lineSpots = [];

  @override
  void initState() {
    super.initState();
    // Define the bar data and line spots here
    barGroups.add(BarChartGroupData(x: 0, barRods: [BarChartRodData(y: 0.2)]));
    barGroups.add(BarChartGroupData(x: 1, barRods: [BarChartRodData(y: 3.5)]));
    barGroups.add(BarChartGroupData(x: 2, barRods: [BarChartRodData(y: 2.1)]));
    barGroups.add(BarChartGroupData(x: 3, barRods: [BarChartRodData(y: 3.3)]));
    barGroups.add(BarChartGroupData(x: 4, barRods: [BarChartRodData(y: 1)]));
    barGroups.add(BarChartGroupData(x: 5, barRods: [BarChartRodData(y: 0)]));
    // Other groups...

    lineSpots.add(FlSpot(0, 0.2));
    lineSpots.add(FlSpot(1, 3.5));
    lineSpots.add(FlSpot(2, 2.1));
    lineSpots.add(FlSpot(3, 3.3));
    lineSpots.add(FlSpot(4, 1));
    lineSpots.add(FlSpot(5, 0));
    // Other spots...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(showTitles: false),
                  leftTitles: SideTitles(showTitles: false),
                ),
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    isCurved: false,
                    spots: lineSpots,
                    colors: [Colors.red],
                    barWidth: 2,
                  )
                ],
              ),
              swapAnimationDuration: const Duration(milliseconds: 0),
            ),
            BarChart(
              BarChartData(
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(showTitles: false),
                    leftTitles: SideTitles(showTitles: false),
                  ),
                  barGroups: barGroups,
                  maxY: 6,
                  axisTitleData: null),
            ),
          ],
        ),
      ),
    );
  }
}
