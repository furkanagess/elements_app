import 'package:flutter/foundation.dart';

/// The `LocalizationProvider` class is used for managing the localization settings
/// within your Flutter application. It allows you to toggle between different
/// language preferences and notifies listeners when the language setting changes.
class LocalizationProvider with ChangeNotifier {
  /// A boolean flag indicating the current language preference.
  /// `true` represents Turkish (Tr), and `false` represents another language.
  bool isTr = true;

  /// Toggles the language preference between Turkish and another language.
  void toggleBool() {
    isTr = !isTr;
    notifyListeners(); // Notifies listeners of data changes
  }
}
