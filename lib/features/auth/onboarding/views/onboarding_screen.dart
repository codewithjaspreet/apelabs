import 'package:apelabs/features/auth/onboarding/controllers/onboarding_controller.dart';
import 'package:apelabs/features/auth/onboarding/widgets/onboarding_page.dart';
import 'package:apelabs/utils/constants/image_strings.dart';
import 'package:apelabs/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
                child: ClayContainer(
                  spread: 10,

                  child: Center(
                    child: Image.asset('assets/images/onboarding_logo.png'),
                  ),
                  // color: const Color.fromARGB(255, 14, 15, 16),
                  height: 90.h,
                  width: 90.w,
                  borderRadius: 150.h / 2, // This makes the container circular
                ),
              ),
            ],
          ),
          PageView(
            controller: onBoardingController.pageController,
            onPageChanged: (value) => onBoardingController.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onboardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onboardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onboardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),
        ],
      ),
    );
  }
}
