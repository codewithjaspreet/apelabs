import 'package:apelabs/features/bluetooth/controllers/bluetooth_controller.dart';
import 'package:apelabs/features/home/views/home.dart';
import 'package:apelabs/utils/constants/sizes.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothConnectivity extends StatefulWidget {
  BluetoothConnectivity({super.key});

  @override
  State<BluetoothConnectivity> createState() => _BluetoothConnectivityState();
}

class _BluetoothConnectivityState extends State<BluetoothConnectivity> {

  @override
  void initState() {
    super.initState();
    // Listen to scan results stream and print device names
    controller.scanResults.listen((results) {
      print('Total Devices ${results.length}');
      for (var result in results) {
        print('Device Name: ${result.device.name}');
      }
    });
  }
  final BluetoothController controller = Get.put(BluetoothController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Pair Device',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                ClayContainer(
                  color: const Color(0XFFE3EDF7),
                  height: 66.h,
                  spread: 0,
                  emboss: true,
                  width: 66.w,
                  borderRadius: 50,
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Skip',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100.w, // Width of the circular container
            height: 100.h, // Height of the circular container
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(
                  0XFF2753EF), // Background color of the circular container
            ),
            child: Center(
              child: Image.asset(
                'assets/images/earbuds.png', // Path to your image asset
                width: 50.w, // Width of the image
                height: 50.h, // Height of the image
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
          ),
          const SearchingDevice(),


          // THIS IS THE CODE FOR -- THE FETCHED STATE OF BLUETOOTH DEVICE
          // Currently it shows no devices , need to check what the issue is , list is coming empty

          // GetBuilder<BluetoothController>(
          //   init: BluetoothController(),
          //   builder: (BluetoothController controller) {
          //     return Column(
          //       children: [
          //         StreamBuilder<List<ScanResult>>(
          //           stream: controller.scanResults,
          //           builder: (context, snapshot) {
          //             print(snapshot);
          //             print('Entered here');
          //             if (snapshot.connectionState == ConnectionState.waiting) {
          //               return const SearchingDevice();
          //             }
          //
          //             else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          //               return ListView.builder(
          //                 itemCount: snapshot.data!.length,
          //                 itemBuilder: (context, index) {
          //
          //                   print(snapshot.data);
          //                   final data = snapshot.data![index];
          //                   print(data);
          //                   return Card(
          //                     elevation: 2,
          //                     child: ListTile(
          //                       title: Text(data.device.name),
          //                       subtitle: Text(data.device.id.id),
          //                       trailing: Text(data.rssi.toString()),
          //                       onTap: () =>
          //                           controller.connectToDevice(data.device),
          //                     ),
          //                   );
          //                 },
          //               );
          //             } else {
          //               return const Center(child: Text("No Device Found"));
          //             }
          //           },
          //         ),
          //       ],
          //     );
          //   },
          // ),


        ],
      ),
    );
  }
}

class SearchingDevice extends StatelessWidget {
  const SearchingDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            'Searching...',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          Image.asset(
            'assets/images/blue_1.png', // Path to your image asset
            width: 60.w, // Width of the image
            height: 60.h, // Height of the image
            fit: BoxFit.cover, // Ensure the image covers the container
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          Text(
            textAlign: TextAlign.center,
            'Make sure your device is in pairing \nmode and nerby',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: TSizes.defaultSpace + 50.h,
          ),
          GestureDetector(
            onTap:  (){
              Get.to(Home());
            },
            child: ClayContainer(
              color: const Color(0XFF829AED),
              width: 157.w,
              height: 42.h,
              spread: 1,
              borderRadius: 7.sp,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Cancel',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}




