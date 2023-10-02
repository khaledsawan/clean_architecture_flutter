import 'package:clean_architecture_flutter/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Connectivity', () {
    late NetworkInfoImpl mockDataConnectionChecker;
    setUp(() async {
      mockDataConnectionChecker = NetworkInfoImpl(InternetConnectionChecker());
    });
    // we don't care about internet status just we need to know if there is true or false value

    test('check retrun type', () async {
      var result = await mockDataConnectionChecker.isConnected;
      expect(result, isA<bool>());
    });
  });
}
