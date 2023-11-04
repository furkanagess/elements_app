import 'package:elements_app/feature/initialize/app_initializer.dart';
import 'package:elements_app/feature/provider/application_provider.dart';
import 'package:elements_app/feature/view/home/home_view.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await AppInitializer().initialize();
  runApp(
    MultiProvider(
      providers: [
        ...ApplicationProvider.instance.appProviders,
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: EnAppStrings.appName,
      theme: AppTheme().theme,
      home: const HomeView(),
    );
  }
}
