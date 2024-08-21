import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/features/auth/signup/controllers/signup_controller.dart';
import 'package:myapp/features/auth/signup/widgets/full_name_screen.dart';
import 'package:myapp/features/auth/signup/widgets/otp_verification_screen.dart';
import 'package:myapp/features/auth/signup/widgets/phonenumber_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: signupController.goBack,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Obx(() {
            return SizedBox(
              height: 2,
              child: LinearProgressIndicator(
                value: (signupController.currentPageIndex.value + 1) /
                    3, // 3 pages in total
                minHeight: 2,
              ),
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
