import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// A class to retrieve device-related information such as device type,
/// IP address, operating system, and screen size.
class DeviceInfo {
  /// An instance of `DeviceInfoPlugin` used to retrieve information about the device.
  ///
  /// This plugin is responsible for providing detailed information about the
  /// device such as the model, operating system version, and other hardware details.
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  /// Retrieves the type of the device.
  ///
  /// Returns the model of the Android or iOS device. If the platform is not
  /// supported or an error occurs, it returns 'Unknown'.
  Future<String> getDeviceType() async {
    try {
      if (Platform.isAndroid) {
        return "Android";
        // AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        // return androidInfo.model;
      } else if (Platform.isIOS) {
        return "iPhone";
        // IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        // return iosInfo.utsname.machine;
      }
    } catch (e) {
      debugPrint('Error getting device type: $e');
      return 'Unknown';
    }
    return 'Unknown';
  }

  /// Retrieves the public IP address of the device.
  ///
  /// Uses an external service to get the public IP address. If the service
  /// is unreachable or an error occurs, it returns 'Unknown'.
  Future<String> getIpAddress() async {
    try {
      const url = 'https://api.ipify.org';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint(
            'Failed to retrieve IP. Status code: ${response.statusCode}');
        return 'Unknown';
      }
    } catch (e) {
      debugPrint('Error fetching public IP: $e');
      return 'Unknown';
    }
  }

  /// Retrieves the operating system of the device.
  ///
  /// Returns the name of the operating system (e.g., 'android', 'ios').
  /// If an error occurs, it returns 'Unknown'.
  Future<String> getOperatingSystem() async {
    try {
      return Platform.operatingSystem;
    } catch (e) {
      debugPrint('Error getting operating system: $e');
      return 'Unknown';
    }
  }

  /// Retrieves the screen size of the device.
  ///
  /// Returns the screen size as a string in the format 'width x height'.
  /// If an error occurs, it returns 'Unknown'.
  Future<String> getDeviceScreenSize() async {
    try {
      final size = MediaQueryData.fromView(
              WidgetsBinding.instance.platformDispatcher.views.first)
          .size;
      final width = size.width;
      final height = size.height;
      return '${width.toInt()} x ${height.toInt()}';
    } catch (e) {
      debugPrint('Error getting screen size: $e');
      return 'Unknown';
    }
  }
}
