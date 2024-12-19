import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:autostarter/autostarter.dart';

void main() {
  const MethodChannel channel = MethodChannel('autostarter');

  TestWidgetsFlutterBinding.ensureInitialized();

  group('Autostarter', () {
    late List<MethodCall> methodCalls;

    setUp(() {
      methodCalls = [];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel,
          (MethodCall methodCall) async {
        methodCalls.add(methodCall);
        // Return mock data if needed
        return null;
      });
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel,
          (MethodCall methodCall) async {
        return null;
      });
    });

    test('isAutoStartPermissionAvailable', () async {
      // Set up expectations
      expect(methodCalls, isEmpty);

      // Call the method
      final bool? result = await Autostarter.isAutoStartPermissionAvailable();

      // Verify the method call
      expect(methodCalls, hasLength(1));
      expect(methodCalls.first.method, 'isAutoStartPermissionAvailable');
      expect(result, null); // Replace with expected result if needed
    });

    test('getAutoStartPermission', () async {
      // Set up expectations
      expect(methodCalls, isEmpty);

      // Call the method
      await Autostarter.getAutoStartPermission(open: true, newTask: false);

      // Verify the method call
      expect(methodCalls, hasLength(1));
      expect(methodCalls.first.method, 'getAutoStartPermission');
      expect(methodCalls.first.arguments, {
        'open': true,
        'newTask': false,
      });
    });

    test('checkAutoStartState', () async {
      // Set up expectations
      expect(methodCalls, isEmpty);

      // Call the method
      final bool? result = await Autostarter.checkAutoStartState();

      // Verify the method call
      expect(methodCalls, hasLength(1));
      expect(methodCalls.first.method, 'checkAutoStartPermissionState');
      expect(result, null); // Replace with expected result if needed
    });

    test('getWhitelistedPackages', () async {
      // Set up expectations
      expect(methodCalls, isEmpty);

      // Call the method
      final List<String> result = await Autostarter.getWhitelistedPackages();

      // Verify the method call
      expect(methodCalls, hasLength(1));
      expect(methodCalls.first.method, 'getWhitelistedPackages');
      expect(result, isEmpty); // Replace with expected result if needed
    });
  });
}
