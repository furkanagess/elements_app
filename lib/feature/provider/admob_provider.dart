import 'package:elements_app/feature/service/google_ads_service.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Admob kütüphanesi kullanılarak oluşturulan reklam komponentlerinin uygulamanın her yerinden çağırılmasına yarar.
final class AdmobProvider with ChangeNotifier {
  final int maxFailedAttempt = 9999999;
  int intersititialLoadAttempts = 0;
  InterstitialAd? interstitialAd;

  void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: GoogleAdsService.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          intersititialLoadAttempts = 0;
          notifyListeners(); // Veri değişikliklerini dinleyenlere bildir
        },
        onAdFailedToLoad: (LoadAdError error) {
          intersititialLoadAttempts += 1;
          interstitialAd = null;
          if (intersititialLoadAttempts >= maxFailedAttempt) {
            createInterstitialAd();
          }
          notifyListeners(); // Veri değişikliklerini dinleyenlere bildir
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          createInterstitialAd();
          notifyListeners(); // Veri değişikliklerini dinleyenlere bildir
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createInterstitialAd();
          notifyListeners(); // Veri değişikliklerini dinleyenlere bildir
        },
      );
      interstitialAd!.show();
    }
  }

  void createAndShowInterstitialAd() {
    createInterstitialAd();
    showInterstitialAd();
  }
}
