import 'package:apelabs/features/auth/onboarding/views/onboarding_screen.dart';
import 'package:apelabs/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
          OnboardingScreen()); // Use Get.offNamed to navigate without the option to return to SplashScreen
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/splash_image.png',
                    width: 400.w,
                    height: 400.h,
                  ),
                ),
                // Logo on top
                Center(
                  child: Image.asset(
                    'assets/images/app_logo.png',
                    width: 300.h,
                    height: 300.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
