import 'package:apelabs/features/auth/onboarding/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3), () {
      Get.to(const OnboardingScreen()); // Use Get.offNamed to navigate without the option to return to SplashScreen
    });
    return  Scaffold(
      
      body: Center(
        child: Image.asset('assets/images/splash_image.png'),
      ),


    );
  }
}
