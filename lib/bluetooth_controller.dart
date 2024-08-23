import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  var connectedDevices = <BluetoothDevice>[].obs;
  var availableDevices = <ScanResult>[].obs;
  var previouslyConnectedDevices = <BluetoothDevice>[].obs;
  var pairedDevices = <BluetoothDevice>[].obs;

  @override
  void onInit() {
    super.onInit();
    scanForDevices();
    fetchConnectedDevices();
  }

  void fetchConnectedDevices() async {
    var devices = await FlutterBluePlus.connectedDevices;
    connectedDevices.value = devices;
    previouslyConnectedDevices.addAll(devices);
    pairedDevices.value = previouslyConnectedDevices.where((device) => !connectedDevices.contains(device)).toList();
  }

  void scanForDevices() {
    availableDevices.clear();
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
    FlutterBluePlus.scanResults.listen((results) {
      availableDevices.value = results;
    });
  }

  void refreshDevices() {
    scanForDevices();
  }

  void connectToDevice(BluetoothDevice device) {
    device.connect(
        autoConnect: false,
        timeout: const Duration(seconds: 10)
    ).then((_) {
      fetchConnectedDevices();
      print("Connection established");
    }).catchError((error) {
      print("Failed to connect: $error");
    });
  }

  void unpairDevice(BluetoothDevice device) {
    pairedDevices.remove(device);
    device.disconnect();
    fetchConnectedDevices();
  }

  Future<void> readCharacteristic(BluetoothDevice device, Guid characteristicId) async {
    List<BluetoothService> services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        if (characteristic.uuid == characteristicId) {
          List<int> value = await characteristic.read();
          print('Read value: $value');
        }
      }
    }
  }

  Future<void> writeCharacteristic(BluetoothDevice device, Guid characteristicId, List<int> data) async {
    List<BluetoothService> services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        if (characteristic.uuid == characteristicId) {
          await characteristic.write(data);
          print('Data written successfully.');
        }
      }
    }
  }

  Future<void> subscribeToNotifications(BluetoothDevice device, Guid characteristicId) async {
    List<BluetoothService> services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        if (characteristic.uuid == characteristicId) {
          await characteristic.setNotifyValue(true);
          characteristic.value.listen((value) {
            print('Notification received: $value');
          });
        }
      }
    }
  }
}
