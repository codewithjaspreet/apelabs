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
  // await Firebase.initializeApp();
  runApp(const MyApp());
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
            home: Home(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
