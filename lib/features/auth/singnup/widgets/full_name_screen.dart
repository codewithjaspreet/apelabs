import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../bluetooth_screen.dart';
import '../controllers/signup_controller.dart';

class FullNamePage extends StatelessWidget {
  final VoidCallback onNext;

  FullNamePage({required this.onNext, super.key});

  // final TextEditingController _nameController = TextEditingController();
  final SignupController signupController =
      Get.find<SignupController>(); // Initialize the controller

  void _onNext() {
    final name = signupController.nameController.text;
    if (name.isNotEmpty) {
      signupController.saveUserName(name); // Method to save user name
    } else {
      // Handle empty name
      print('Please enter your full name');
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
                  'Please Provide your Full Name',
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
                  'Please Provide name for Apelabs Account',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              controller: signupController.nameController,
                              // keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter full name',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                                // counterText: "",
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
                        ),
                      ],
                    )

                ),
                SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Max 64 Characters",style: GoogleFonts.chivo(
                  textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: const Color(0XFF828282),
                ),
      ),),
                ],
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
                            icon: Icon(Icons.arrow_forward, color: Colors.black45),
                            // onPressed: _onNext,
                            onPressed: () async{
                              Get.to(() => BluetoothDevicesPage());
                            },
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
