import 'package:flutter/foundation.dart';
import 'package:flutter_is_emulator/flutter_is_emulator.dart';
import 'dart:io' show Platform;

class Config {
  static Future<String> get host async {
    if (kIsWeb || await FlutterIsEmulator.isDeviceAnEmulatorOrASimulator) {
      if (Platform.isAndroid) {
        return emulatorHost;
      }
      return simulatorHost;
    } else {
      return deviceHost;
    }
  }

  static final deviceHost = '2.tcp.ngrok.io';
  static final emulatorHost = '10.0.2.2';
  static final simulatorHost = 'localhost';

  static Future<int> get port async {
    if (kIsWeb || await FlutterIsEmulator.isDeviceAnEmulatorOrASimulator) {
      return simulatorPort;
    } else {
      return devicePort;
    }
  }

  static final devicePort = kIsWeb ? 8080 : 19028;
  static final simulatorPort = kIsWeb ? 8080 : 50051;
}
