import 'package:flutter/material.dart';
import 'package:max_gym/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      cardColor: AppColors.cardLight,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.textDark),
        bodyMedium: TextStyle(color: AppColors.textDark),
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.backgroundLight,
        foregroundColor: AppColors.textDark,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      cardColor: AppColors.cardDark,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.textLight),
        bodyMedium: TextStyle(color: AppColors.textLight),
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.backgroundDark,
        foregroundColor: AppColors.textLight,
      ),
    );
  }
}
