import 'package:apelabs/features/auth/singnup/views/full_name_screen.dart';
import 'package:apelabs/features/auth/singnup/views/otp_verification_screen.dart';
import 'package:apelabs/features/auth/singnup/views/phonenumber_screen.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _goBack() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: SizedBox(
            height: 2, // Adjust the height of the progress indicator
            child: LinearProgressIndicator(
              value: (_currentPage + 1) / 4, // 4 is the total number of steps
              minHeight: 2, // Ensure the minHeight matches the container height
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          PhoneNumberPage(
              onNext: () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300), curve: Curves.easeIn)),
          OtpVerificationPage(
              onNext: () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300), curve: Curves.easeIn)),
          FullNamePage(
              onNext: () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300), curve: Curves.easeIn)),
        ],
      ),
    );
  }
}
