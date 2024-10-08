import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

class FullNamePage extends StatelessWidget {
  final VoidCallback onNext;

  const FullNamePage({super.key, required this.onNext});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Enter your full name', style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 16), // Space between text and input field
                  ClayContainer(
                      color: baseColor,
                      spread: 3,
                      emboss: true,
                      width:
                          double.infinity, // Make the ClayContainer full width
                      borderRadius: 12,
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none, // Remove default border

                            hintText: 'Enter full name',
                          ),
                        ),
                      ))),
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
