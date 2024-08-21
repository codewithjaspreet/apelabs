import 'dart:io';

import 'package:apelabs/features/bluetooth/views/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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

  void forward() {
    if (isLastPage) {
      // Navigate to BluetoothConnectivity screen
      Get.to(() => BluetoothConnectivity());
    } else {
      // Go to the next page
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    }
  }
}
