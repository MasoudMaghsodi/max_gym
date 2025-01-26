import 'package:flutter/material.dart';
import '../models/exercise_category.dart';

class CategoryDialog extends StatelessWidget {
  final List<ExerciseCategory> categories;
  final Function(ExerciseCategory) onCategorySelected;

  const CategoryDialog({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("انتخاب دسته‌بندی"),
      content: SingleChildScrollView(
        child: Column(
          children: categories
              .map((cat) => ListTile(
                    title: Text(cat.name),
                    onTap: () {
                      onCategorySelected(cat);
                      Navigator.pop(context);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
