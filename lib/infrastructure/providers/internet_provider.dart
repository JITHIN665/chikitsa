import 'dart:async';
import 'package:chikitsa/theme/widgets/no_internet_popup.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

class InternetProvider with ChangeNotifier {
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  bool get isConnected => _connectionStatus.isNotEmpty && !_connectionStatus.contains(ConnectivityResult.none);
  List<ConnectivityResult> get connectionStatus => _connectionStatus;

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  InternetProvider() {
    _initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log("⚠️ Couldn't check connectivity status", error: e);
      return;
    }
    _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result;
    print("📡 Connectivity changed: $_connectionStatus");
    notifyListeners();

    if (!isConnected) {
      _showNoInternetPopup();
    } else {
      _closePopup();
    }
  }

  void _showNoInternetPopup() {
    BuildContext? context = navigatorKey.currentContext;
    if (context != null) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent dismissal
        builder: (context) => const NoInternetPopup(),
      );
    }
  }

  void _closePopup() {
    if (navigatorKey.currentContext != null) {
      Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
    }
  }

  @override
  void dispose() {
    print("🛑 Disposing InternetProvider & Cancelling Subscription");
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
