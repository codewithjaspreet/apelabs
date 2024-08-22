import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class PhoneNumberPage extends StatelessWidget {
  final VoidCallback onNext;

  PhoneNumberPage({required this.onNext, super.key});

  final TextEditingController _phoneController = TextEditingController();
  final SignupController signupController =
      Get.find<SignupController>(); // Initialize the controller

  void _sendOtp() async {
    final phoneNumber = _phoneController.text;
    if (phoneNumber.isNotEmpty) {
      await signupController.sendOtp(phoneNumber); // Method to send OTP
      onNext(); // Proceed to OTP verification page
    } else {
      // Handle empty phone number
      print('Please enter a valid phone number');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Color baseColor = Color(0xFFE3EDF7);

    return Container(
      height: screenHeight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter your phone number', style: TextStyle(fontSize: 24)),
                SizedBox(height: 16),
                ClayContainer(
                  color: baseColor,
                  spread: 3,
                  emboss: true,
                  width: double.infinity,
                  borderRadius: 12,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: IntlPhoneField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                        ),
                        initialCountryCode: 'IN',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: ClayContainer(
                  spread: 0,
                  emboss: true,
                  color: baseColor,
                  height: 70,
                  width: 70,
                  borderRadius: 50,
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward, color: Colors.black54),
                      onPressed: _sendOtp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
