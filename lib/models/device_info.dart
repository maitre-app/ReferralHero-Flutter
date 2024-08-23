import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeviceInfo {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<String?> getDeviceType() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        return androidInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        return iosInfo.utsname.machine;
      }
    } catch (e) {
      debugPrint(e.toString());
      return 'Unknown';
    }
    return null;
  }

  Future<String?> getIpAddress() async {
    try {
      const url = 'https://api.ipify.org';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint(
            'Failed to retrieve IP. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching public IP: $e');
      return null;
    }
  }

  Future<String> getOperatingSystem() async {
    try {
      return Platform.operatingSystem;
    } catch (e) {
      return 'Unknown';
    }
  }

  Future<String> getDeviceScreenSize() async {
    try {
      final width = WidgetsBinding.instance.window.physicalSize.width;
      final height = WidgetsBinding.instance.window.physicalSize.height;
      return '${width.toInt()} x ${height.toInt()}';
    } catch (e) {
      return 'Unknown';
    }
  }
}
