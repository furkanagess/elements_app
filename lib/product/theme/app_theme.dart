import 'package:elements_app/product/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: AppColors.background,
      iconTheme: const IconThemeData(
        size: 30,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.pink,
        elevation: 3,
      ),
    );
  }
}
