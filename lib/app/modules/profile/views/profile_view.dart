import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          title: const Text(
            'User Profile',
            style: TextStyle(color: AppColor.whiteColor),
          ),
          backgroundColor: AppColor.backgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(
                  Icons.movie,
                  color: AppColor.whiteColor,
                ),
                title: const Text(
                  'Watchlist',
                  style: TextStyle(color: AppColor.whiteColor),
                ),
                onTap: () {
                  Get.toNamed('/watchlist-movie');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: AppColor.whiteColor,
                ),
                title: const Text(
                  'Favorite Movies',
                  style: TextStyle(color: AppColor.whiteColor),
                ),
                onTap: () {
                  Get.toNamed('/favorite-movie');
                },
              ),
            ],
          ),
        ));
  }
}
