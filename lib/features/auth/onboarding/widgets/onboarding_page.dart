import 'package:apelabs/features/auth/splash/views/splash_screen.dart';
import 'package:apelabs/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clay_containers/clay_containers.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: ClayContainer(
                color: const Color(0XffE3E6EC),
                height: 276.h,
                width: 276.w,
                borderRadius: 20,
                child: ClayContainer(
                  color: const Color(0xFFE0E0E0), // Frame color
                  height: 188.h,
                  width: 188.w,
                  borderRadius: 15,
                  child: Center(
                    child: Image.asset(
                      image,
                      width: 180.w,
                      height: 180.h,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
