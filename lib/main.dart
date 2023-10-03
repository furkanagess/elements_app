import 'package:elements_app/feature/view/home/home_view.dart';
import 'package:elements_app/product/constants/themeConstants/app_strings.dart';
import 'package:elements_app/product/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme().theme,
      home: const HomeView(),
    );
  }
}
