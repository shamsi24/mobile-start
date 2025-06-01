import 'dart:developer';

import 'package:rht_mobile_template/presentation/utils/connection_status_listener.dart';

class ConnectionManager {
  final ConnectionStatusListener _connectionStatus = ConnectionStatusListener.instance;

  Future<void> initNoInternetListener() async {
    await _connectionStatus.initialize();

    if (!_connectionStatus.hasConnection) {
      _updateConnectivity(false);
    }

    _connectionStatus.connectionChange.listen((hasConnection) {
      log("Connection status changed: $hasConnection");
      _updateConnectivity(hasConnection);
    });
  }

  void _updateConnectivity(bool hasConnection) {
    if (!hasConnection) {
      if (!_connectionStatus.hasShownNoInternet) {
        _connectionStatus.hasShownNoInternet = true;
        print("No internet connection");
      }
    } else {
      if (_connectionStatus.hasShownNoInternet) {
        _connectionStatus.hasShownNoInternet = false;
        print("Internet connection restored");
      }
    }
  }
}
