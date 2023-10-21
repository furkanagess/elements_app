import 'dart:io';

class GoogleAdsService {
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3499593115543692/9910553185";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
