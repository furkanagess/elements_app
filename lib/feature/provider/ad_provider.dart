// import 'package:elements_app/feature/service/google_ads_service.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdProviderNotifier extends ChangeNotifier {
//   final int maxFailedAttempt = 5000;
//   int intersititialLoadAttempts = 0;
//   InterstitialAd? interstitialAd;

//   void createInterstitialAd() {
//     InterstitialAd.load(
//       adUnitId: GoogleAdsService.interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           interstitialAd = ad;
//           intersititialLoadAttempts = 0;
//           notifyListeners();
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           intersititialLoadAttempts += 1;
//           interstitialAd = null;
//           if (intersititialLoadAttempts >= maxFailedAttempt) {
//             createInterstitialAd();
//           }
//           notifyListeners();
//         },
//       ),
//     );
//   }

//   void showInterstitialAd() {
//     if (interstitialAd != null) {
//       interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//         onAdDismissedFullScreenContent: (InterstitialAd ad) {
//           ad.dispose();
//           createInterstitialAd();
//           notifyListeners();
//         },
//         onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//           ad.dispose();
//           createInterstitialAd();
//           notifyListeners();
//         },
//       );
//       interstitialAd!.show();
//       notifyListeners();
//     }
//   }
// }
