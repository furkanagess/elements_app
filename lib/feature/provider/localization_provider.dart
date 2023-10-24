import 'package:flutter/foundation.dart';

class LocalizationProvider with ChangeNotifier {
  bool isTr = true;

  void toggleBool() {
    isTr = !isTr;
    notifyListeners();
  }
}
