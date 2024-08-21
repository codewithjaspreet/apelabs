import 'package:apelabs/utils/constants/colors.dart';
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
    final NavigationController navigationController = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => navigationController.screens[navigationController.selectedIndex.value]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 25.0),
        child: ClayContainer(
          height: 97.h,
          color: Colors.red,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Obx(
                  () => BottomAppBar(
                height: 94.h,
                shape: const CircularNotchedRectangle(),
                notchMargin: 6.0,
                color: isDark ? Colors.black : Colors.white,
                child: SizedBox(
                  child: NavigationBar(
                    destinations: [
                      _buildNavigationItem(
                        index: 0,
                        isSelected: navigationController.selectedIndex.value == 0,
                        icon: Icons.home,
                        label: 'Home',
                      ),
                      _buildNavigationItem(
                        index: 1,
                        isSelected: navigationController.selectedIndex.value == 1,
                        icon: Icons.drafts,
                        label: 'Drafts',
                      ),
                      _buildNavigationItem(
                        index: 2,
                        isSelected: navigationController.selectedIndex.value == 2,
                        icon: Icons.done,
                        label: 'Completed',
                      ),

                    ],
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    selectedIndex: navigationController.selectedIndex.value,
                    onDestinationSelected: navigationController.updateIndex,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  NavigationDestination _buildNavigationItem({
    required int index,
    required bool isSelected,
    required IconData icon,
    required String label,
  }) {
    return NavigationDestination(
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? const Color(0XFF4771AB) : Colors.grey,
        ),
        width: 33.w,
        height: 33.h,
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      label: label,
    );
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
  }

  final screens = [
    const Home(),
    const Home(),
    const Home(),
    const Home(),
    const Home(),
  ];
}
