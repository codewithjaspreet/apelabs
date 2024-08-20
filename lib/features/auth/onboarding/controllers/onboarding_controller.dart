import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class OnBoardingController extends GetxController {
  // instance of OnBoardingController
  static OnBoardingController get instance => Get.find();

  Rx<int> currentPageIndex = 0.obs;

  // page controller for the page view

  final PageController pageController = PageController();

  // updates the current index when the page is scrolled
  updatePageIndicator(index) => currentPageIndex.value = index;

  dotNavigationClicked(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    print(currentPageIndex.value);
    if (currentPageIndex.value != 2) {
      //Login Screen
    }
    int page = currentPageIndex.value + 1;
    print('aya?');
    print(page);
    pageController.animateToPage(
      page,
      duration:
          const Duration(milliseconds: 300), // Adjust the duration as needed
      curve: Curves.easeInOut, // Adjust the animation curve if desired
    );
  }
}
