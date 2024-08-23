import 'package:apelabs/features/auth/onboarding/controllers/onboarding_controller.dart';
import 'package:apelabs/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatelessWidget {
   OnBoardingController controller = Get.put(OnBoardingController());

   OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ClayContainer(
              color: const Color(0XFFE3E6EC),
              height: 250.h,
              width: 250.w,
              borderRadius: 42.sp,
              child: Center(
                child: ClayContainer(
                  color: const Color(0XFFE3E6EC),
                  height: 188.h, // Inner container height
                  width: 188.w, // Inner container width
                  borderRadius: 40.sp, // Inner container border radius
                  emboss: true,
                  depth: 20,
                  child: Center(
                    child: Image.asset(
                      image,
                      width: 166.w,
                      height: 166.h,
                      fit: BoxFit
                          .cover, // Ensures the image fits well inside the container
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          Text(
            textAlign: TextAlign.center,
            title,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 28.sp,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            textAlign: TextAlign.center,
            subtitle,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15.sp,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          GestureDetector(
            onTap: (){
              controller.forward(context);
            },
            child: ClayContainer(
              color: const Color(0xffE3E6EC),
              height: 80.h,
              width: 80.w,
              borderRadius: 50,
              child: Center(
                child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 30.sp,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}