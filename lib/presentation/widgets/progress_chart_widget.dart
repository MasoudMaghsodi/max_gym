import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/core/constants/app_colors.dart';

class ProgressChartWidget extends StatelessWidget {
  final int athleteId;

  const ProgressChartWidget({super.key, required this.athleteId});

  @override
  Widget build(BuildContext context) {
    // داده‌های نمونه (بعداً از دیتابیس واقعی پر می‌شه)
    final weightData = [
      FlSpot(0, 70), // ماه اول
      FlSpot(1, 72),
      FlSpot(2, 71),
      FlSpot(3, 70),
    ];

    return SizedBox(
      height: 300.h,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40.w,
                getTitlesWidget: (value, meta) => Text(
                  '${value.toInt()} kg',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text(
                  'ماه ${value.toInt() + 1}',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: weightData,
              isCurved: true,
              color: AppColors.primary,
              barWidth: 2.w,
              dotData: const FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
