import 'package:apelabs/features/home/controllers/homecontroller.dart';
import 'package:apelabs/utils/constants/sizes.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Homecontroller controller = Get.put(Homecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace / 2,
            vertical: TSizes.defaultSpace * 2.5,
          ),
          child: Column(
            children: [
              const TopBar(
                profileUrl: 'https://plus.unsplash.com/premium_photo-1689551670902-19b441a6afde?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww',
                userName: 'Rachna',
              ),
              Padding(
                padding: EdgeInsets.only(top: TSizes.defaultSpace * 3),
                child: RippleAnimation(
                  color: const Color(0XFF4771AB),
                  delay: const Duration(milliseconds: 2000),
                  minRadius: 75,
                  repeat: true,
                  ripplesCount: 4,
                  duration: const Duration(milliseconds: 3000),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    minRadius: 75.sp,
                    maxRadius: 75.sp,
                    backgroundImage: const AssetImage('assets/images/home_earpods.png'),
                  ),
                ),
              ),
              const DeviceInfo(deviceName: 'True Earbuds W11'),
              const ConnectNowBanner(),
              const MeditationBanner(),

              const ResponsiveGridView(
                items: [
                  {
                    'imageUrl': 'assets/images/home_earpods.png',
                    'title': 'Airspin Moon Silver - Wireless Earphones',
                    'subtitle': '859332YU',
                    'priceInRupees': '₹4998/-',
                  },
                  {
                    'imageUrl': 'assets/images/home_earpods.png',
                    'title': 'Airspin Moon Silver - Wireless Earphones',
                    'subtitle': '859332YU',
                    'priceInRupees': '₹4998/-',
                  },
                  {
                    'imageUrl': 'assets/images/home_earpods.png',
                    'title': 'Airspin Moon Silver - Wireless Earphones',
                    'subtitle': '859332YU',
                    'priceInRupees': '₹4998/-',
                  },
                  {
                    'imageUrl': 'assets/images/home_earpods.png',
                    'title': 'Airspin Moon Silver - Wireless Earphones',
                    'subtitle': 'Subtitle 4',
                    'priceInRupees': '₹4998/-',
                  },
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.profileUrl, required this.userName});
  final String profileUrl;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Profile icon with circular image
        Container(
          width: 40.sp,
          height: 40.sp,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            image: DecorationImage(
              image: NetworkImage(profileUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi $userName!',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              'Good Evening',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: const Color(0XFF4771AB),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 73.w,
          height: 35.h,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0XFF4771AB)),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(35.h / 2),
          ),
          child: Center(
            child: Image.asset('assets/images/blue_2.png'),
          ),
        ),
      ],
    );
  }
}

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({super.key, required this.deviceName});
  final String deviceName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Hi $deviceName',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: Colors.black,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 5.w,
              height: 5.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              'Connected to Phone',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: const Color(0XFF4771AB),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ConnectNowBanner extends StatelessWidget {
  const ConnectNowBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: TSizes.defaultSpace * 3),
      width: 350.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14.sp)),
        gradient: const LinearGradient(
          stops: [0.0, 0.4],
          colors: [
            Color(0xFF97040F),
            Color(0xFF4771AB),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 25.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connect together to \nListen song & chat',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            ClayContainer(
              borderRadius: 9.sp,
              width: 147.w,
              height: 35.h,
              spread: 0,
              child: Center(
                child: Text(
                  'Connect Now',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: const Color(0XFF4771AB),
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
class MeditationBanner extends StatelessWidget {
  const MeditationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347.w, // Width of the container
      height: 178.h, // Height of the container
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14.sp)),
        color: Colors.white, // Background color of the container
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.sp,
            offset: Offset(0, 2.sp),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Meditation with Ape Lab',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp, // Responsive text size
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Number of items
              itemBuilder: (context, index) {
                return const MeditationItem(imageUrl: 'https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-nature-mountain-scenery-with-flowers-free-photo.jpg?w=600&quality=80', subtitle: 'Zen');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MeditationItem extends StatelessWidget {
  const MeditationItem({super.key, required this.imageUrl, required this.subtitle});

  final String imageUrl;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 66.w, // Size of the circular container
            height: 66.h, // Size of the circular container
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200], // Background color of the circular container
              image: DecorationImage(
                image: NetworkImage(imageUrl), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp, // Responsive text size
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ResponsiveGridView extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const ResponsiveGridView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w), // Reduced vertical space
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Buy Similar Products',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Text(
                'View All',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: const Color(0xff959595),
                  ),
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 0.8, // Adjust aspect ratio to fit items better
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      item['imageUrl'],
                      fit: BoxFit.cover, // Use BoxFit.cover to maintain aspect ratio
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item['title'],
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          item['subtitle'],
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Color(0xff959595),
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          item['priceInRupees'],
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17.sp,
                              color: Colors.black,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
