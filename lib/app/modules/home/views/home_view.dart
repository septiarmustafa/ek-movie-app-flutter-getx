import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Stream Everywhere',
            style: TextStyle(color: AppColor.brownColor)),
        backgroundColor: AppColor.backgroundColor,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Now Playing',
                style: TextStyle(fontSize: 20, color: AppColor.whiteColor)),
          ),
          Obx(() {
            if (controller.isLoadingNowPlaying.value) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColor.whiteColor,
              ));
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in controller.nowPlayingMovies.take(6))
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/detail-movie',
                          arguments: i,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MovieCard(movie: i),
                      ),
                    )
                ],
              ),
            );
          }),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text('Popular',
                style: TextStyle(fontSize: 20, color: AppColor.whiteColor)),
          ),
          Obx(() {
            if (controller.isLoadingPopular.value) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColor.whiteColor,
              ));
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in controller.popularMovies.take(20))
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/detail-movie',
                          arguments: i,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MovieCard(movie: i),
                      ),
                    )
                ],
              ),
            );
          }),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text('Top Rated',
                style: TextStyle(fontSize: 20, color: AppColor.whiteColor)),
          ),
          Obx(() {
            if (controller.isLoadingTopRated.value) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColor.whiteColor,
              ));
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i in controller.topRatedMovies.take(10))
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/detail-movie',
                          arguments: i,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MovieCard(movie: i),
                      ),
                    )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
