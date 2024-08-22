import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

class OtpVerificationPage extends StatelessWidget {
  final VoidCallback onNext;

  const OtpVerificationPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Color baseColor = const Color(0xFFE3EDF7);

    return SizedBox(
      height: screenHeight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter your otp', style: TextStyle(fontSize: 24)),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red, // Border color
                  width: 2, // Border width
                ),
                borderRadius: BorderRadius.circular(
                    50), // Match the ClayContainer border radius
              ),
              child: Center(
                // Center the ClayContainer within the Container
                child: ClayContainer(
                  spread: 0,
                  emboss: true,
                  color: baseColor, // Base color for ClayContainer
                  height: 70,
                  width: 70,
                  borderRadius: 50,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward, color: Colors.black45),
                      onPressed:
                          onNext, // Call the onNext function when pressed
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
