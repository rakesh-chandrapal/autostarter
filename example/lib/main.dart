import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:autostarter/autostarter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldMessengerState> _messengerKey = GlobalKey<ScaffoldMessengerState>();

  // Method to request AutoStart permission
  Future<void> getAutoStartPermission() async {
    try {
      // Check if AutoStart permission feature is available on the device
      bool? isAvailable = await Autostarter.isAutoStartPermissionAvailable();
      if (isAvailable == true) {
        // Check the AutoStart permission state
        bool? status = await Autostarter.checkAutoStartState();
        if (status == null) {
          // Handle null status if needed
        } else {
          if (status == false) {
            // Request AutoStart permission if it is not enabled
            await Autostarter.getAutoStartPermission(newTask: true);
          } else {
            // Show snackbar message if AutoStart permission is already allowed
            _messengerKey.currentState?.showSnackBar(
              SnackBar(content: Text('You have already allowed the AutoStart Permission')),
            );
          }
        }
      } else {
        // Show snackbar message if AutoStart permission is not available on the device
        _messengerKey.currentState?.showSnackBar(
          SnackBar(content: Text("Your phone doesn't require Auto Start Permission")),
        );
      }
    } on PlatformException {
      // Show snackbar message if there is an error getting the platform version
      _messengerKey.currentState?.showSnackBar(
        SnackBar(content: Text('Failed to get platform version')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: Text('AutoStarter Plugin example app'),
        ),
        body: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              // Call the method to request AutoStart permission
              getAutoStartPermission();
            },
            child: Text('Request Auto Start Permission'),
          ),
        ),
      ),
    );
  }
}
