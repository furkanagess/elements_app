import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppInitializer {
  static AppInitializer? _instance;
  bool _isInitialized = false;

  factory AppInitializer() {
    _instance ??= AppInitializer._internal();
    return _instance!;
  }

  AppInitializer._internal();

  Future<void> initialize() async {
    if (!_isInitialized) {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      MobileAds.instance.initialize();
      // diğer initialize işlemleri buraya eklenir
      _isInitialized = true;
    }
  }
}
