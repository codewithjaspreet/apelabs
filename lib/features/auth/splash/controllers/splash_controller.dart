import 'package:get/get.dart';

import '../../onboarding/views/onboarding_screen.dart';

class SplashController extends GetxController{



  void navigateToOnboarding(){
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(
         'onboarding'); // Use Get.offNamed to navigate without the option to return to SplashScreen
    });
  }
}