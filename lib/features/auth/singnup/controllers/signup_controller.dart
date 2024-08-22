import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rx<int> currentPageIndex = 0.obs;
  final PageController pageController = PageController();

  void updatePageIndicator(int index) => currentPageIndex.value = index;

  Future<void> sendOtp(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification handling
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store verificationId for later use
        print('Code sent');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout
      },
    );
  }

  Future<void> verifyOtp(String otpCode) async {
    // Retrieve the stored verificationId and complete the sign-in
    String verificationId = ''; // Retrieve from a stored location
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );

    try {
      await _auth.signInWithCredential(credential);
      // Navigate to the next page or handle successful verification
    } catch (e) {
      print('Verification failed: $e');
    }
  }

  Future<void> saveUserName(String name) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'name': name,
        'phone': user.phoneNumber,
      });
      // Proceed to next page or complete registration
    }
  }

  void goBack() {
    if (pageController.page != 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void nextPage() {
    if (pageController.page != 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
}
