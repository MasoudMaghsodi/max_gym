import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String name;
  final String muscleGroup;
  final int sets;
  final int reps;
  final String technique;

  const WorkoutCard({
    super.key,
    required this.name,
    required this.muscleGroup,
    required this.sets,
    required this.reps,
    required this.technique,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'گروه عضلانی: $muscleGroup',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'ست‌ها: $sets',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'تکرارها: $reps',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'تکنیک: $technique',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 30.0,
        ),
      ),
    );
  }
}
