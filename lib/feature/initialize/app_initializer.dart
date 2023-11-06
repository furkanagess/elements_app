import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// The `AppInitializer` class is used to manage the initialization process
/// of your Flutter application. It orchestrates and executes crucial tasks that
/// need to be performed before the application starts. These tasks may include
/// initializing the Flutter binding, starting Firebase, or initializing ad services.
///
class AppInitializer {
  static AppInitializer? _instance;
  bool _isInitialized = false;

  /// Singleton constructor method for creating a single instance (Singleton design pattern).
  factory AppInitializer() {
    _instance ??= AppInitializer._internal();
    return _instance!;
  }

  /// Private constructor accessible only from within the class.
  AppInitializer._internal();

  /// Used to initialize the application and perform necessary startup tasks.
  ///
  /// This function is controlled by the `_isInitialized` flag, ensuring that
  /// the tasks are executed only once. If using Firebase, this function starts
  /// Firebase. If using [MobileAds], it initializes ad services. In both cases,
  /// the required Flutter binding is ensured.
  Future<void> initialize() async {
    if (!_isInitialized) {
      WidgetsFlutterBinding.ensureInitialized();

      // Start Firebase.
      await Firebase.initializeApp();

      // Initialize Google Mobile Ads.
      MobileAds.instance.initialize();

      // Marks the completion of the initialization process.
      _isInitialized = true;
    }
  }
}
