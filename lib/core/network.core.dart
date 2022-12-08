import 'package:connectivity_plus/connectivity_plus.dart';

/// Base class for checking the internet connectivity.
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Class for implementing the NetworkInfo class.
class ConnectivityNetworkInfo extends NetworkInfo {
  final Connectivity connectivity;

  ConnectivityNetworkInfo(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}
