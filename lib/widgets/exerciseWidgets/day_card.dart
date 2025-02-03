import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  final String day;
  final bool isActive;
  final ValueChanged<bool>? onChanged;

  const DayCard({
    super.key,
    required this.day,
    this.isActive = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Switch(
              value: isActive,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
