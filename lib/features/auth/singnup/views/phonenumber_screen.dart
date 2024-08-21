// import 'package:flutter/material.dart';
// import 'package:clay_containers/clay_containers.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// class PhoneNumberPage extends StatelessWidget {
//   final VoidCallback onNext;
//
//   const PhoneNumberPage({super.key, required this.onNext});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     Color baseColor = const Color(0xFFE3EDF7);
//
//     return SizedBox(
//       height: screenHeight,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Enter your phone number',
//                     style: TextStyle(fontSize: 24),
//                   ),
//                   const SizedBox(
//                       height: 16), // Add space between text and input field
//                   ClayContainer(
//                       color: baseColor,
//                       spread: 3,
//                       emboss: true,
//                       width:
//                           double.infinity, // Make the ClayContainer full width
//                       borderRadius: 12,
//                       child: Center(
//                         child: IntlPhoneField(
//                           disableLengthCheck: true,
//                           showCountryFlag: false,
//                           textAlignVertical: TextAlignVertical.center,
//                           decoration: const InputDecoration(
//                             border: InputBorder.none, // Remove default border
//                             hintText: 'Phone Number',
//                             hintStyle: TextStyle(color: Colors.black54),
//                           ),
//                           initialCountryCode: 'IN',
//                           onChanged: (phone) {
//                             print(phone.completeNumber);
//                           },
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//             Container(
//               height: 80,
//               width: 80,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.red, // Border color
//                   width: 2, // Border width
//                 ),
//                 borderRadius: BorderRadius.circular(
//                     50), // Match the ClayContainer border radius
//               ),
//               child: Center(
//                 // Center the ClayContainer within the Container
//                 child: ClayContainer(
//                   spread: 0,
//                   emboss: true,
//                   color: baseColor, // Base color for ClayContainer
//                   height: 70,
//                   width: 70,
//                   borderRadius: 50,
//                   child: Center(
//                     child: IconButton(
//                       icon: const Icon(Icons.arrow_forward, color: Colors.black54),
//                       onPressed:
//                           onNext, // Call the onNext function when pressed
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
