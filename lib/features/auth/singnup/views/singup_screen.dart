import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../bluetooth_screen.dart';
import '../controllers/signup_controller.dart';
import '../widgets/full_name_screen.dart';
import '../widgets/otp_verification_screen.dart';
import '../widgets/phonenumber_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: signupController.goBack,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Obx(() {
            double progress = (signupController.currentPageIndex.value + 1) / 3;

            return Stack(
              children: [
                // Dynamic Gradient Background
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFD94948),
                        Color(0xFF992237),
                        Color(0xFFE9524B),
                        Color(0xFFD84847),
                        Color(0xFFEDF2F7),
                      ],
                      stops: [
                        0.0,
                        progress * 0.2, // Adjust stops based on progress
                        progress * 0.4,
                        progress * 0.6,
                        progress
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                // Progress indicator
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * progress,
                    height: 2,
                    color: Colors.transparent, // Make sure the container is transparent
                  ),
                ),
              ],
            );
          }),
        ),
      ),
      body: PageView(
        controller: signupController.pageController,
        onPageChanged: (value) => signupController.updatePageIndicator(value),
        children: [
          PhoneNumberPage(onNext: signupController.nextPage),
          OtpVerificationPage(onNext: signupController.nextPage),
          FullNamePage(onNext: () {

            // Handle final step completion, if needed
          }),
        ],
      ),
    );
  }
}
