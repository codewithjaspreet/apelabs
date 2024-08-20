import 'package:apelabs/features/bluetooth/controllers/bluetooth_controller.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BluetoothConnectivity extends StatelessWidget {
  BluetoothConnectivity({super.key});
  final ClayController controller = Get.put(ClayController());
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
            color: controller.baseColor,
            child: Center(
              child: Obx(() {
                return ClayContainer(
                  color: controller.baseColor,
                  height: 240,
                  width: 240,
                  borderRadius: 200,
                  curveType: CurveType.concave,
                  spread: 30,
                  depth: controller.firstDepth.value.toInt(),
                  child: Center(
                    child: ClayContainer(
                      height: 200,
                      width: 200,
                      borderRadius: 200,
                      depth: controller.secondDepth.value.toInt(),
                      curveType: CurveType.convex,
                      color: controller.baseColor,
                      child: Center(
                        child: ClayContainer(
                          height: 160,
                          width: 160,
                          borderRadius: 200,
                          color: controller.baseColor,
                          depth: controller.thirdDepth.value.toInt(),
                          curveType: CurveType.concave,
                          child: Center(
                            child: ClayContainer(
                              height: 120,
                              width: 120,
                              borderRadius: 200,
                              color: controller.baseColor,
                              depth: controller.fourthDepth.value.toInt(),
                              curveType: CurveType.convex,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
