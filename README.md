# autostarter

A Flutter plugin for managing the autostart permission feature on Android devices.

[![yetunnaing](https://img.shields.io/badge/yetunnaing-autostarter-blue.svg)](https://github.com/yetunnaing18121996/autostarter) [![Pub Version](https://img.shields.io/pub/v/autostarter.svg)](https://pub.dev/packages/autostarter) [![License](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](LICENSE)

## Features

- Check if the autostart permission feature is available on the device.
- Get the autostart permission by opening the autostart settings activity.
- Check the autostart permission state (specific to MIUI devices).
- Retrieve the list of whitelisted packages (specific to MIUI devices).

## Getting Started

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  autostarter: ^0.0.2
```

Import the package :
    
    import 'package:autostarter/autostarter.dart';

Check Availability of Autostart Permission Feature :
    
    bool? isAvailable = await Autostarter.isAutoStartPermissionAvailable();
    if (isAvailable == true) {
        // Autostart permission feature is available on the device
    } else {
        // Autostart permission feature is not available on the device
    }

Request Autostart Permission :
    
    await Autostarter.getAutoStartPermission(open: true, newTask: false);

Check Autostart Permission State (MIUI Devices) :  
    
    bool? isAutoStartEnabled = await Autostarter.checkAutoStartState();
    if (isAutoStartEnabled == true) {
        // Autostart permission is enabled on MIUI devices
    } else {
        // Autostart permission is disabled on MIUI devices
    }

Get Whitelisted Packages (MIUI Devices) :  
    
    List<String> whitelistedPackages = await Autostarter.getWhitelistedPackages();
    // Do something with the whitelisted package list



## Acknowledgments :
 
    Thanks to the original Android native author judemanutd and XomaDev for the inspiration and codebase.
    
    Feel free to modify the content according to your project's requirements.


