import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

class OtpVerificationPage extends StatelessWidget {
  final VoidCallback onNext;

  OtpVerificationPage({required this.onNext, super.key});

  final SignupController signupController =
      Get.find<SignupController>(); // Initialize the controller

  void _verifyOtp(String otpCode) {
    signupController.verifyOtp(otpCode); // Method to verify OTP
    onNext(); // Proceed to full name page
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
                  'Verify with OTP Sent to ${signupController.phoneController.text}',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0XFF333333),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/auto_fetching.svg",
                      // width: 20,
                      height: 25,
                    ),
                    Text(
                      'Auto fetching OTP',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: const Color(0XFF828282),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                NeumorphicOtpField(
                  numberOfFields: 6,
                  borderColor: Color(0xFF512DA8),
                  onCodeChanged: (String code) {
                    if(code.length  == 6 ){
                      print("hsdfidugsdfius");
                      _verifyOtp(code);

                    }
                    else{

                      print("5746543678");
                    }
                  },
                  onSubmit: (String otpCode) {
                    _verifyOtp(otpCode);
                  },
                ),
                SizedBox(height: 33),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn’t receive it? Reply in ",style: GoogleFonts.chivo(
                  textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: const Color(0XFF828282),
                ),
      ),),
                    Text("00:20 sec",style: GoogleFonts.chivo(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0XFF380835),
                      ),
                    ),),
                  ],
                )


                // OtpTextField(
                //   numberOfFields: 6,
                //   borderColor: Color(0xFF512DA8),
                //   showFieldAsBox: true,
                //   onCodeChanged: (String code) {
                //     // Optionally handle code changes
                //   },
                //   onSubmit: (String otpCode) {
                //     _verifyOtp(otpCode);
                //   },
                // ),
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
                            onPressed: () {
                              // You might want to handle the OTP submission here as well
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32,),
                  Text("By Clicking continue, You agree to our",style: GoogleFonts.chivo(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: const Color(0XFF8F8F8F),
                    ),
                  ),),
                  Text(" Terms of Services and Privacy Policy.",style: GoogleFonts.chivo(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: const Color(0XFFE19920),
                    ),
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class NeumorphicOtpField extends StatefulWidget {
  final int numberOfFields;
  final Color borderColor;
  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onSubmit;

  NeumorphicOtpField({
    required this.numberOfFields,
    required this.borderColor,
    required this.onCodeChanged,
    required this.onSubmit,
  });

  @override
  _NeumorphicOtpFieldState createState() => _NeumorphicOtpFieldState();
}

class _NeumorphicOtpFieldState extends State<NeumorphicOtpField> {
  List<TextEditingController> controllers = [];
  List<String> fieldValues = [];

  @override
  void initState() {
    super.initState();
    controllers =
        List.generate(widget.numberOfFields, (_) => TextEditingController());
    fieldValues = List.generate(widget.numberOfFields, (_) => '');
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }


  void _handleCodeChanged(int index, String value) {
    if (index >= 0 && index < fieldValues.length) {
      setState(() {
        fieldValues[index] = value;
        if (value.length == 1 && index < widget.numberOfFields - 1) {
          FocusScope.of(context).nextFocus();
        }

        // Check if all fields are filled
        bool allFilled = fieldValues.every((field) => field.isNotEmpty);
        if (allFilled) {
          print("All inputs are filled");
        }

        widget.onCodeChanged(fieldValues.join(''));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.numberOfFields, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          child: ClayContainer(
            color: Color(0xFFE3EDF7).withOpacity(0.7),
            borderRadius: 12,
            height: 55,
            width: 45,
            spread: 2,
            emboss: true,
            child: Center(
              child: TextField(
                controller: controllers[index],
                maxLength: 1,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 16,
                ),
                onChanged: (value) {
                  _handleCodeChanged(index, value);
                },
                onSubmitted: (value) {
                  if (index == widget.numberOfFields - 1) {
                    widget.onSubmit(fieldValues.join(''));
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
