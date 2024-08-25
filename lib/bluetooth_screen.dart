import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bluetooth_controller.dart';
import 'features/home/views/home.dart';

class BluetoothDevicesPage extends StatelessWidget {
  final BluetoothController bluetoothController =
  Get.put(BluetoothController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          'Music App',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: const Color(0XFF4771AB),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GestureDetector(
              onTap: () {
                Get.offAll(() => Home());
              },
              child: ClayContainer(
                color: const Color(0XFFE3EDF7),
                height: 55,
                spread: 2,
                emboss: true,
                width: 55,
                borderRadius: 50,
                child: Center(
                  child: Text(
                    'Skip',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              // Connected Devices Section
              _buildSectionTitle('Connected Devices'),
              Obx(() {
                return Column(
                  children: bluetoothController.connectedDevices
                      .map((device) => _buildDeviceTile(
                    device['name'] ?? "Unknown Device",
                    icon: Icons.bluetooth_connected,
                    iconColor: Colors.blue,
                  ))
                      .toList(),
                );
              }),
              const SizedBox(height: 20),

              // Paired Devices Section
              _buildSectionTitle('Paired Devices'),
              Obx(() {
                return Column(
                  children: bluetoothController.pairedDevices.map((device) {
                    return _buildDeviceTile(
                      device['name'] ?? "Unknown Device",
                      trailing: ElevatedButton(
                        onPressed: () =>
                            bluetoothController.unpairDevice(device),
                        child: Text(
                          'Unpair',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: const Color(0XFF008000),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 20),

              // Available Devices Section
              _buildSectionTitle('Available Devices'),
              Obx(() {
                return Column(
                  children: bluetoothController.availableDevices.map((result) {
                    // final device = result['device'];
                    final Map<String, String> device = result['device'] as Map<String, String>;

                    return _buildDeviceTile(
                      device['name'] ?? "Unknown Device",
                      trailing: TextButton(
                        onPressed: () {
                          // final device = result['device'] as Map<String, String>;

                          bluetoothController.connectToDevice(device);
                        },
                        child: Text(
                          'Connect',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: const Color(0XFF008000),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClayContainer(
          color: const Color(0xFFEAEAEA),
          depth: 6,
          borderRadius: 56,
          height: 56,
          width: 56,
          child: Center(
            child: IconButton(
              icon: Icon(Icons.refresh, color: Colors.blueGrey[800]),
              onPressed: bluetoothController.refreshDevices,
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: const Color(0XFF919191),
          ),
        ),
      ),
    );
  }

  // Helper method to build device tiles
  Widget _buildDeviceTile(String title, {IconData? icon, Color? iconColor, Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ClayContainer(
        color: const Color(0xFFE3EDF7),
        depth: 2,
        spread: 0,
        borderRadius: 8,
        child: ListTile(
          leading: icon != null
              ? Icon(icon, color: iconColor ?? Colors.black)
              : const Icon(Icons.headphones, color: Colors.black),
          title: Text(
            title,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
