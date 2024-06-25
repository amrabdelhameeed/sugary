import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sugar/core/database_provider/glucose_db_provider.dart';
import 'package:sugar/core/models/glucose_model.dart';
import 'package:intl/intl.dart';

class GlucoseChart extends StatelessWidget {
  const GlucoseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      child: ValueListenableBuilder<Box<GlucoseModel>>(
        valueListenable: GlucoseDBprovider.listenable(),
        builder: (context, box, _) {
          List<GlucoseModel> data = box.values
              .toList()
              .where(
                (element) => DateFormat("yyyy-MM-dd").format(element.dateTime!) == DateFormat("yyyy-MM-dd").format(DateTime.now()),
              )
              .toList();
          data.sort((a, b) => a.dateTime!.compareTo(b.dateTime!));

          List<FlSpot> glucoseSpots = data.map((item) {
            var timestamp = item.dateTime!.millisecondsSinceEpoch.toDouble();
            return FlSpot(timestamp, item.read?.toDouble() ?? 0.0);
          }).toList();

          return LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: glucoseSpots,
                  isCurved: false,
                  color: Colors.blue,
                ),
              ],
              gridData: const FlGridData(show: true),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: calculateInterval(glucoseSpots) == 0 ? 10.0 : calculateInterval(glucoseSpots),
                    getTitlesWidget: (value, meta) {
                      var date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                      var formattedDate = DateFormat('hh:mm a').format(date);
                      return SideTitleWidget(
                        angle: 25,
                        axisSide: meta.axisSide,
                        child: Text(formattedDate, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 8)),
                      );
                    },
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: true),
              lineTouchData: LineTouchData(enabled: true),
            ),
          );
        },
      ),
    );
  }

  double calculateInterval(List<FlSpot> glucoseSpots) {
    if (glucoseSpots.isNotEmpty) {
      var duration = glucoseSpots.last.x - glucoseSpots.first.x;
      return duration / 10; // Adjust this factor based on your specific needs
    }
    return 1; // Default interval
  }
}
