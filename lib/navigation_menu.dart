import 'package:apelabs/features/community/views/community_screen.dart';
import 'package:apelabs/features/music/views/music_screen.dart';
import 'package:apelabs/features/stream/views/streaming_screen.dart';
import 'package:apelabs/utils/helpers/helper_functions.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'features/home/views/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final NavigationController navigationController =
        Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => ClayContainer(
          spread: 1,
          child: BottomNavigationBar(
            items: [
              _buildNavigationBarItem(
                context,
                'assets/images/home.png',
                'Home',
                0,
                navigationController.selectedIndex.value,
                isDark,
              ),
              _buildNavigationBarItem(
                context,
                'assets/images/community.png',
                'Community',
                1,
                navigationController.selectedIndex.value,
                isDark,
              ),
              _buildNavigationBarItem(
                context,
                'assets/images/music.png',
                'Music',
                2,
                navigationController.selectedIndex.value,
                isDark,
              ),
              _buildNavigationBarItem(
                context,
                'assets/images/stream.png',
                'Stream',
                3,
                navigationController.selectedIndex.value,
                isDark,
              ),
            ],
            backgroundColor: isDark ? Colors.black : Colors.white,
            selectedItemColor: isDark ? Colors.white : Colors.blue,
            unselectedItemColor: isDark ? Colors.grey : Colors.grey,
            showSelectedLabels: true, // Show label for selected item
            showUnselectedLabels: true, // Show label for unselected items
            onTap: navigationController.updateIndex,
          ),
        ),
      ),
      body: Obx(() => navigationController
          .screens[navigationController.selectedIndex.value]),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
    BuildContext context,
    String assetPath,
    String label,
    int index,
    int selectedIndex,
    bool isDark,
  ) {
    return BottomNavigationBarItem(
      icon: _buildIcon(assetPath, index == selectedIndex, isDark),
      label: label,
    );
  }

  Widget _buildIcon(String assetPath, bool isSelected, bool isDark) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          width: 24.w,
          height: 24.h,
          assetPath,
          color: isSelected ? Colors.white : Color(0XFF919191),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
  }

  final screens = [Home(),  CommunityScreen(), MusicScreen(), StreamingScreen()];
}
