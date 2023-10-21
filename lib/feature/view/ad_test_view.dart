import 'package:elements_app/feature/service/google_ads_service.dart';
import 'package:elements_app/feature/view/home/home_view.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdTestView extends StatefulWidget {
  const AdTestView({super.key});

  @override
  State<AdTestView> createState() => _AdTestViewState();
}

class _AdTestViewState extends State<AdTestView> {
  final int maxFailedAttempt = 3;
  int _intersititialLoadAttempts = 0;
  InterstitialAd? _interstitialAd;
  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: GoogleAdsService.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _intersititialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _intersititialLoadAttempts += 1;
          _interstitialAd = null;
          if (_intersititialLoadAttempts >= maxFailedAttempt) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                _showInterstitialAd();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              child: Container(
                height: 300,
                width: 300,
                color: AppColors.pink,
                child: const Center(child: Text("Element")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
