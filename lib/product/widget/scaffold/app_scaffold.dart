import 'package:elements_app/feature/service/network_service.dart';
import 'package:flutter/material.dart';
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
                Center(child: Text("Pleasce check your internet connection !")),
              ],
            ),
    );
  }
}
