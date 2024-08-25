import 'package:get/get.dart';
import 'bluetooth_manager.dart';

class BluetoothController extends GetxController {
  var connectedDevices = <Map<String, String>>[].obs;
  var pairedDevices = <Map<String, String>>[].obs;
  var availableDevices = <Map<String, String>>[].obs;

  final BluetoothManager _bluetoothManager = BluetoothManager();

  @override
  void onInit() {
    super.onInit();
    fetchPairedDevices();
    fetchConnectedDevices();
  }

  void fetchPairedDevices() async {
    pairedDevices.value = await _bluetoothManager.getPairedDevices();
  }

  void fetchConnectedDevices() async {
    connectedDevices.value = await _bluetoothManager.getConnectedDevices();
  }

  void discoverDevices() async {
    _bluetoothManager.setDeviceDiscoveryHandler((device) {
      availableDevices.add(device);
    });
    await _bluetoothManager.startDiscovery();
  }

  void connectToDevice(Map<String, String> device) async {
    String address = device['address'] ?? '';
    if (address.isNotEmpty) {
      await _bluetoothManager.connectToDevice(address);
      fetchConnectedDevices();
    }
  }

  void refreshDevices() {
    fetchPairedDevices();
    fetchConnectedDevices();
    discoverDevices();
  }

  void unpairDevice(Map<String, String> device) {
   // will addd logic for unpairing
  }
}
