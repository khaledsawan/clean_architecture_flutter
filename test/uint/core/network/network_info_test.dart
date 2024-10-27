import 'package:clean_architecture_flutter/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

void main() {
  group('Connectivity', () {
    late NetworkInfoImpl mockDataConnectionChecker;
    setUp(() async {
      mockDataConnectionChecker = NetworkInfoImpl(InternetConnection());
    });

    // we don't care about internet status just we need to know if there is bool
    test('check retrun type', () async {
      var result = await mockDataConnectionChecker.isConnected;
      expect(result, isA<bool>());
    });
  });
}
