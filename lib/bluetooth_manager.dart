import 'package:flutter/services.dart';

class BluetoothManager {
  static var platform = const MethodChannel('com.example.apelabs/bluetooth');

  Future<List<Map<String, String>>> getPairedDevices() async {
    final List<dynamic> devices = await platform.invokeMethod('getPairedDevices');
    return devices.map((d) => Map<String, String>.from(d)).toList();
  }

  Future<List<Map<String, String>>> getConnectedDevices() async {
    final List<dynamic> devices = await platform.invokeMethod('getConnectedDevices');
    return devices.map((d) => Map<String, String>.from(d)).toList();
  }

  Future<void> startDiscovery() async {
    await platform.invokeMethod('startDiscovery');
  }

  Future<void> stopDiscovery() async {
    await platform.invokeMethod('stopDiscovery');
  }

  Future<void> connectToDevice(String address) async {
    await platform.invokeMethod('connectToDevice', {'address': address});
  }

  // Method to handle discovered device
  void setDeviceDiscoveryHandler(Function(Map<String, String>) onDeviceDiscovered) {
    platform.setMethodCallHandler((call) async {
      if (call.method == "onDeviceDiscovered") {
        final device = Map<String, String>.from(call.arguments);
        onDeviceDiscovered(device);
      }
    });
  }
}
