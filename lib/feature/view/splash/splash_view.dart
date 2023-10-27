import 'package:elements_app/feature/view/home/home_view.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(
      const Duration(milliseconds: 1500),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomeView(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/my-logo-removebg.png",
              height: context.dynamicHeight(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
