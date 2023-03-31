import 'dart:io';
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class AppConnectivity {
  static final AppConnectivity _singleton = AppConnectivity._internal();
  AppConnectivity._internal();
  static AppConnectivity getInstance() => _singleton;

  bool hasConnection = false;

  StreamController<bool> connectionChangeController =
      StreamController<bool>.broadcast();

  Stream<bool> get connectionChange => connectionChangeController.stream;

  static StreamSubscription<ConnectivityResult> conectivitySubscription;

  static String loaiKetNoi(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.bluetooth:
        return "bluetooth";
      case ConnectivityResult.wifi:
        return "wifi";
      case ConnectivityResult.ethernet:
        return "ethernet";
      case ConnectivityResult.mobile:
        return "mobile";
      case ConnectivityResult.none:
        return "none";
      case ConnectivityResult.vpn:
        return "vpn";
    }
    return '';
  }

  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = true;
    }

    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }
}
