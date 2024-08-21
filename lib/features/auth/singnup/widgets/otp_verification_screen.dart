// import 'package:flutter/material.dart';
// import 'package:clay_containers/clay_containers.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
//
// import '../controllers/signup_controller.dart';
//
// class OtpVerificationPage extends StatelessWidget {
//   final VoidCallback onNext;
//
//   OtpVerificationPage({required this.onNext, super.key});
//
//   final SignupController signupController =
//       Get.find<SignupController>(); // Initialize the controller
//
//   void _verifyOtp(String otpCode) {
//     signupController.verifyOtp(otpCode); // Method to verify OTP
//     onNext(); // Proceed to full name page
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     Color baseColor = Color(0xFFE3EDF7);
//
//     return Container(
//       height: screenHeight,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Enter your OTP', style: TextStyle(fontSize: 24)),
//                 OtpTextField(
//                   numberOfFields: 6,
//                   borderColor: Color(0xFF512DA8),
//                   showFieldAsBox: true,
//                   onCodeChanged: (String code) {
//                     // Optionally handle code changes
//                   },
//                   onSubmit: (String otpCode) {
//                     _verifyOtp(otpCode);
//                   },
//                 ),
//               ],
//             ),
//             Container(
//               height: 80,
//               width: 80,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.red,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               child: Center(
//                 child: ClayContainer(
//                   spread: 0,
//                   emboss: true,
//                   color: baseColor,
//                   height: 70,
//                   width: 70,
//                   borderRadius: 50,
//                   child: Center(
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_forward, color: Colors.black45),
//                       onPressed: () {
//                         // You might want to handle the OTP submission here as well
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
