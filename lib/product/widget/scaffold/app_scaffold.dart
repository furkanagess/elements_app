import 'package:elements_app/feature/service/network_service.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var networkStatus = Provider.of<NetworkStatus>(context);
    return Scaffold(
      body: networkStatus == NetworkStatus.online
          ? child
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Center(
                      child: Lottie.asset(
                        AssetConstants.instance.lottieConnection,
                        fit: BoxFit.cover,
                        reverse: true,
                        repeat: true,
                        height: context.dynamicHeight(0.3),
                      ),
                    ),
                    Text(
                      AppStrings.connectionError,
                      style: context.textTheme.bodyMedium,
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
