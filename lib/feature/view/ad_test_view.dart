import 'package:elements_app/feature/mixin/admob/ad_mob_mixin.dart';
import 'package:elements_app/feature/view/home/home_view.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AdTestView extends StatefulWidget {
  const AdTestView({super.key});

  @override
  State<StatefulWidget> createState() => _AdTestViewState();
}

class _AdTestViewState extends State<StatefulWidget> with AdMobMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                showInterstitialAd();
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
