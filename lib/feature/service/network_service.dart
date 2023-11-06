import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// The `NetworkService` class is responsible for monitoring the network connectivity
/// status in your Flutter application. It provides a stream of network status updates
/// and allows you to check whether the application is online or offline.

enum NetworkStatus { online, offline }

class NetworkService {
  /// Stream controller for monitoring network status changes.
  StreamController<NetworkStatus> controller = StreamController();

  /// Constructor for initializing the `NetworkService` and listening to network changes.
  NetworkService() {
    Connectivity().onConnectivityChanged.listen((event) {
      controller.add(_networkStatus(event));
    });
  }

  /// Returns the network status based on the given `ConnectivityResult`.
  NetworkStatus _networkStatus(ConnectivityResult connectivityResult) {
    return connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }
}
