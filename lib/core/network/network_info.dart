import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';


abstract class NetworkInfo {
  Future<bool> get isConnected;

  Stream<InternetStatus> get subscription;

}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasInternetAccess;

  var isDeviceConnected = false;

  @override
  Stream<InternetStatus> get subscription =>
     InternetConnection().onStatusChange;
}
