import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/modules/home/views/home_view.dart';
import 'package:ek_movie_app/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColor.backgroundColor,
          unselectedItemColor: AppColor.whiteColor,
          selectedItemColor: AppColor.brownColor,
          selectedFontSize: 12.0,
          onTap: controller.changeBottomBar,
          currentIndex: controller.tabIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: Icons.person_outline,
              activeIcon: Icons.person,
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            HomeView(),
            ProfileView(),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    IconData? icon,
    String? label,
    IconData? activeIcon,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: AppColor.backgroundColor,
      icon: Icon(icon),
      label: label,
      activeIcon: Icon(activeIcon),
    );
  }
}
