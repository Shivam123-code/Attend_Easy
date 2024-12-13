//import 'package:attend_easy/admin/homepage.dart';
import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(DashboardPage());
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard('Total Students', '200', Colors.green),
                _buildStatCard('Total Lecturers', '50', Colors.blue),
                _buildStatCard('Attendance Rate', '85%', Colors.orange),
              ],
            ),
            SizedBox(height: 20),
            Text('Attendance Chart'),
            Container(
              height: 300,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      colors: [Colors.blue],
                      spots: [
                        FlSpot(0, 80),
                        FlSpot(1, 85),
                        FlSpot(2, 83),
                        FlSpot(3, 88),
                        FlSpot(4, 90),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text(value, style: TextStyle(color: Colors.white, fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
