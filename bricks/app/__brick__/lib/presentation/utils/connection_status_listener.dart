import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatusListener {
  static final _instance = ConnectionStatusListener._internal();
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionChangeController = StreamController<bool>.broadcast();

  bool hasConnection = false;
  bool hasShownNoInternet = false;

  ConnectionStatusListener._internal();

  static ConnectionStatusListener get instance => _instance;

  Stream<bool> get connectionChange => _connectionChangeController.stream;

  Future<void> initialize() async {
    _connectivity.onConnectivityChanged.listen((_) => _checkConnection());
    await _checkConnection(); // Initial check
  }

  Future<void> _checkConnection() async {
    final previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      _connectionChangeController.add(hasConnection);
    }
  }

  void dispose() {
    _connectionChangeController.close();
  }
}
