import 'dart:io';

/// The `GoogleAdsService` class provides access to the AdMob interstitial ad unit ID based on the platform.
/// It returns the appropriate ad unit ID for Android platforms and throws an error for unsupported platforms.
class GoogleAdsService {
  /// Returns the AdMob interstitial ad unit ID for Android platforms.
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3499593115543692/7181453654";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
