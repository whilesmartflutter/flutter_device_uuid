import 'package:flutter/services.dart';

class DeviceUuid {
  static const MethodChannel _channel = MethodChannel('flutter_device_uuid');

  static Future<String?> uuid() async {
    try {
      final String deviceId = await _channel.invokeMethod('uuid');
      return deviceId;
    } catch (e) {
      return null;
    }
  }
}
