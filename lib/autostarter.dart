import 'dart:async';

import 'package:flutter/services.dart';

class Autostarter {
  static const MethodChannel _channel = const MethodChannel('autostarter');

  /// Checks if the autostart permission feature is available on the device
  /// Returns 'true' if the Autostart permission feature is available , 'false' otherwise.
  static Future<bool?> isAutoStartPermissionAvailable() async {
    final bool? autoStartAvailable =
        await _channel.invokeMethod('isAutoStartPermissionAvailable');
    return autoStartAvailable;
  }

  /// [open] : If true, it will attempt to open the activity,
  /// otherwise it will just check its existence
  ///
  /// [newTask] : if true, the activity is attempted to be opened
  /// it will add FLAG_ACTIVITY_NEW_TASK to the intent
  static Future<void> getAutoStartPermission({
    bool open = false,
    bool newTask = false,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("open", () => open);
    args.putIfAbsent("newTask", () => newTask);

    await _channel.invokeMethod('getAutoStartPermission', args);
  }

  /// Check the autostart Permission State on the device
  /// Only applicable for MIUI devices
  /// Returns 'true' is AutoStart Permission is enabled, 'false' otherwise
  static Future<bool?> checkAutoStartState() async {
    return await _channel.invokeMethod("checkAutoStartPermissionState");
  }

  /// Retrieves the list of whitelisted packages on the device
  /// Only applicable for MIUI devices
  /// Returns a list of package names that are whitelisted for MIUI
  // Inside your autostarter.dart file
  static Future<List<String>> getWhitelistedPackages() async {
    final List<dynamic>? result =
        await _channel.invokeMethod("getWhitelistedPackages");
    return List<String>.from(result ?? []);
  }
}
