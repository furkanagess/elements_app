import 'package:elements_app/feature/view/elements/all_elements_page.dart';
import 'package:elements_app/feature/view/home/home_view.dart';
import 'package:elements_app/product/constants/app_strings.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: HomeView(),
    );
  }
}
