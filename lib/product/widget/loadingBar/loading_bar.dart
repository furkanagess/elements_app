import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AssetConstants.instance.lottieLoadingChemistry,
        fit: BoxFit.cover,
        reverse: true,
        repeat: true,
        height: context.dynamicHeight(0.1),
      ),
    );
  }
}
