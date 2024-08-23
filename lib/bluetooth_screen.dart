import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bluetooth_controller.dart';
import 'features/auth/singnup/views/phonenumber_screen.dart';
import 'features/auth/singnup/views/singup_screen.dart';
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
          'Music app',
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
              onTap: () async {
                // Get.offAll(() => SignupScreen());
                Get.offAll(() => Home());
              },
              child: ClayContainer(
                color: const Color(0XFFE3EDF7),
                height: 55,
                spread: 2,
                emboss: true,
                // emboss: true,
                width: 55,
                borderRadius: 50,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Skip',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            // Connected Devices Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connected Devices',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: const Color(0XFF919191),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...bluetoothController.connectedDevices.map((device) {
                      return ClayContainer(
                        color: const Color(0xFFE3EDF7),
                        depth: 2,
                        spread: 0,
                        borderRadius: 8,
                        child: ListTile(
                          leading:
                              const Icon(Icons.headphones, color: Colors.black),
                          title: Text(
                            device.name.isNotEmpty
                                ? device.name
                                : "Unknown Device",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          trailing: const Icon(Icons.bluetooth_connected,
                              color: Colors.blue),
                        ),
                      );
                    }).toList(),
                  ],
                );
              }),
            ),
            // Paired Devices Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Paired Devices',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: const Color(0XFF919191),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...bluetoothController.pairedDevices.map((device) {
                      return ListTile(
                        leading:
                            const Icon(Icons.headphones, color: Colors.black),
                        title: Text(
                            device.name.isNotEmpty
                                ? device.name
                                : "Unknown Device",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            )),
                        // subtitle: Text(device.id.toString()),
                        trailing: ElevatedButton(
                          onPressed: () =>
                              bluetoothController.unpairDevice(device),
                          child: const Text('Unpair'),
                        ),
                      );
                    }).toList(),
                  ],
                );
              }),
            ),

            // Available Devices Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Available Devices',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0XFF919191),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    ...bluetoothController.availableDevices.map((result) {
                      final device = result.device;
                      return ListTile(
                          leading:
                              const Icon(Icons.headphones, color: Colors.black),
                          title: Text(
                              device.name.isNotEmpty
                                  ? device.name
                                  : "Unknown Device",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              )),
                          // subtitle: Text(device.id.toString()),
                          trailing: TextButton(
                              onPressed: () {
                                bluetoothController.connectToDevice(device);
                              },
                              child: Text(
                                "Connect",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: const Color(0XFF008000),
                                  ),
                                ),
                              )));
                    }).toList(),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClayContainer(
          color: const Color(0xFFEAEAEA),
          // emboss: true,
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
}
