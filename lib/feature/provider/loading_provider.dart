import 'package:flutter/material.dart';

class LoadingProvider with ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> startLoading(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2)); // 2 saniye bekleme süresi
    _isLoading = false;
    notifyListeners();

    // Yükleme süresi dolduktan sonra yükleme ekranını kapat
  }
}
