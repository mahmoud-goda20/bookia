import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whiteColor,
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor, onSurface: AppColors.darkColor),
      scaffoldBackgroundColor: AppColors.whiteColor,
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.redColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.redColor))));

  static ThemeData dark = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkColor,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.whiteColor,
      ),
      scaffoldBackgroundColor: AppColors.darkColor,
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.redColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.redColor))));
}
