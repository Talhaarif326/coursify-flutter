import 'package:internet_connection_checker/internet_connection_checker.dart';

// Domain-facing contract: the rest of the app only depends on this
// abstraction, not on any specific connectivity-checking package.
// Makes it swappable/mockable in tests.
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

// Concrete implementation using the internet_connection_checker package
class NetworkInfoImplement implements NetworkInfo {
  @override
  // Delegates to the package's built-in connectivity check
  // (pings a real host, not just "is wifi/data on")
  Future<bool> get isConnected =>
      InternetConnectionChecker.instance.hasConnection;
}
