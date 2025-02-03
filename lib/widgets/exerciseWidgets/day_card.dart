import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  final String day;
  const DayCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day),
          Switch(value: true, onChanged: (value) {}),
        ],
      ),
    );
  }
}
