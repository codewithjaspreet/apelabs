import 'dart:io';

import 'package:apelabs/features/auth/singnup/views/singup_screen.dart';
import 'package:apelabs/features/auth/splash/views/splash_screen.dart';
import 'package:apelabs/features/home/views/home.dart';
import 'package:equalizer_flutter_custom/equalizer_flutter_custom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'features/bluetooth/views/connectivity.dart';
import 'navigation_menu.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  runApp(const MyApp());
}

Future<void> initFirebase() async {
  try {
    String apiKey = Platform.isAndroid
        ? "AIzaSyCaxERseqE4RJMLcr5Gv3-d4FyPfDW_qbk"
        : "Your iOS API Key"; // Replace with your iOS API Key if needed
    String appId = Platform.isAndroid
        ? "1:1087153818274:android:3d8e59fb026eb83e4e65fb"
        : "Your iOS App ID"; // Replace with your iOS App ID if needed
    String messagingSenderId = "1087153818274";
    String projectId = "apelabs-1ab76";

    // Initialize Firebase with a named instance
    await Firebase.initializeApp(
      // name: "BluetoothApp",
      options: FirebaseOptions(
        apiKey: apiKey,
        appId: appId,
        messagingSenderId: messagingSenderId,
        projectId: projectId,
      ),
    );

    // Debug log to confirm Firebase initialization
    print("Firebase initialized successfully.");

  } catch (e) {
    print("Firebase initialization error: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, a) {
        return   MultiProvider(
          providers: [
            ChangeNotifierProvider<EqualizerProvider>(
              create: (context) => EqualizerProvider(),
            ),
          ],
          child: GetMaterialApp(
            home: SplashScreen(),
            // home: Home(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
