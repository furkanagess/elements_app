import 'package:elements_app/feature/service/google_ads_service.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// The `AdmobProvider` class is responsible for managing interstitial ads using the
/// AdMob service. It provides methods for creating and displaying interstitial ads
/// in your Flutter application.
class AdmobProvider with ChangeNotifier {
  final int maxFailedAttempt = 9999999;
  int intersititialLoadAttempts = 0;
  InterstitialAd? interstitialAd;

  /// Creates and loads an interstitial ad.
  void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: GoogleAdsService.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          intersititialLoadAttempts = 0;
          notifyListeners(); // Notify listeners of data changes
        },
        onAdFailedToLoad: (LoadAdError error) {
          intersititialLoadAttempts += 1;
          interstitialAd = null;
          if (intersititialLoadAttempts >= maxFailedAttempt) {
            createInterstitialAd();
          }
          notifyListeners(); // Notify listeners of data changes
        },
      ),
    );
  }

  /// Displays the loaded interstitial ad.
  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          createInterstitialAd();
          notifyListeners(); // Notify listeners of data changes
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createInterstitialAd();
          notifyListeners(); // Notify listeners of data changes
        },
      );
      interstitialAd!.show();
    }
  }

  /// Creates and shows an interstitial ad.
  void createAndShowInterstitialAd() {
    createInterstitialAd();
    showInterstitialAd();
  }
}
