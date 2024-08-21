import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:get/get.dart';
import 'package:myapp/features/auth/signup/controllers/signup_controller.dart';

class FullNamePage extends StatelessWidget {
  final VoidCallback onNext;

  FullNamePage({required this.onNext, super.key});

  final TextEditingController _nameController = TextEditingController();
  final SignupController signupController =
      Get.find<SignupController>(); // Initialize the controller

  void _onNext() {
    final name = _nameController.text;
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
                Text('Enter your full name', style: TextStyle(fontSize: 24)),
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
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter full name',
                        ),
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
                      icon: Icon(Icons.arrow_forward, color: Colors.black45),
                      onPressed: _onNext,
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
