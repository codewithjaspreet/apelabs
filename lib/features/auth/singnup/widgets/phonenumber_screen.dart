import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class PhoneNumberPage extends StatelessWidget {
  final VoidCallback onNext;

  PhoneNumberPage({required this.onNext, super.key});
 final SignupController signupController =
      Get.find<SignupController>(); // Initialize the controller

  void _sendOtp() async {
    final phoneNumber = signupController.phoneController.text;
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
                Text(
                  'Enter your phone number',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: const Color(0XFF333333),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'OTP will be sent to this number',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: const Color(0XFF828282),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                ClayContainer(
                  color: baseColor,
                  spread: 3,
                  emboss: true,
                  height: 50,
                  width: double.infinity,
                  borderRadius: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Country Code Container
                      Container(
                        width : 80,
                        child: IntlPhoneField(
                          showCountryFlag: false,
                          controller: signupController.countryController,
                          initialCountryCode: 'IN',
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "", // Remove the counter
                            contentPadding: EdgeInsets.symmetric(vertical: 12), // Adjust padding
                          ),
                          dropdownTextStyle: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp, // Smaller font size
                              color: const Color(0XFF686868),
                            ),
                          ),
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp, // Smaller font size
                              color: const Color(0XFF687B9E),
                            ),
                          ),
                          disableLengthCheck: true, // Disable length validation
                          onChanged: (phone) {
                            // Handle country code changes if needed
                          },
                        ),
                      ),
                      // Divider
                      Container(
                        width: 1,
                        color: Colors.grey,
                        height: 20,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      // Phone Number Input Field
                      Expanded(
                        child: TextField(
                          controller: signupController.phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            counterText: "",
                          ),
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: const Color(0XFF687B9E),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )

                )

              ],
            ),
            Container(
              height: 200,

              child: Column(
                children: [
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
          ],
        ),
      ),
    );
  }
}
