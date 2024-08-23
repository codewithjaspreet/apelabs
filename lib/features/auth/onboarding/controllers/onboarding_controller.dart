import 'dart:io';

import 'package:apelabs/features/bluetooth/views/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../bluetooth_screen.dart';
import '../../singnup/views/singup_screen.dart';

class OnBoardingController extends GetxController {
  // Instance of OnBoardingController
  static OnBoardingController get instance => Get.find();

  void handleBackButton() {
    if (Platform.isAndroid || Platform.isIOS) {
      exit(0); // This will close the app
    }
  }

  var onPageIndex = 0.obs;
  bool get isLastPage => onPageIndex.value == 2; // Check if the current page is the last one
  var pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      // Update page index when the page changes
      onPageIndex.value = pageController.page?.round() ?? 0;
    });
  }

  void forward(BuildContext context) {
    if (isLastPage) {
      // Navigate to BluetoothConnectivity screen
      // Get.to(() => BluetoothConnectivity());

      _requestPermissions(context);
      print("Hello World");
    } else {
      // Go to the next page
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    }
  }





  Future<void> _requestPermissions(BuildContext context) async {
    final bluetoothStatus = await Permission.bluetooth.request();
    final bluetoothScanStatus = await Permission.bluetoothScan.request();
    final bluetoothConnectStatus = await Permission.bluetoothConnect.request();
    final locationStatus = await Permission.location.request();

    print('Bluetooth permission status: $bluetoothStatus');
    print('Bluetooth Scan permission status: $bluetoothScanStatus');
    print('Bluetooth Connect permission status: $bluetoothConnectStatus');
    print('Location permission status: $locationStatus');

    if (bluetoothStatus.isGranted &&
        bluetoothScanStatus.isGranted &&
        bluetoothConnectStatus.isGranted &&
        locationStatus.isGranted) {
      Get.offAll(() => SignupScreen());
      // Get.to(() => BluetoothDevicesPage());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bluetooth and Location permissions are required')),
      );
    }

    checkPermissions();
  }


  void checkPermissions() async {
    final bluetoothStatus = await Permission.bluetooth.status;
    final bluetoothScanStatus = await Permission.bluetoothScan.status;
    final bluetoothConnectStatus = await Permission.bluetoothConnect.status;
    final locationStatus = await Permission.location.status;

    print('Bluetooth permission status: $bluetoothStatus');
    print('Bluetooth Scan permission status: $bluetoothScanStatus');
    print('Bluetooth Connect permission status: $bluetoothConnectStatus');
    print('Location permission status: $locationStatus');
  }

}
