import 'package:elements_app/feature/service/google_ads_service.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

mixin TestMixin on State {
  final int maxFailedAttempt = 5000;
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
        },
        onAdFailedToLoad: (LoadAdError error) {
          intersititialLoadAttempts += 1;
          interstitialAd = null;
          if (intersititialLoadAttempts >= maxFailedAttempt) {
            createInterstitialAd();
          }
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
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createInterstitialAd();
        },
      );
      interstitialAd!.show();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    interstitialAd?.dispose();
  }
}
