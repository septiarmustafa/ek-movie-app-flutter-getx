import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_movie_controller.dart';

class FavoriteMovieView extends GetView<FavoriteMovieController> {
  const FavoriteMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          title: const Text('Favorite Movies',
              style: TextStyle(color: AppColor.whiteColor))),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.favoriteMovies.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    size: 100,
                    color: AppColor.whiteColor,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No favorite movies yet.',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.favoriteMovies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MovieCard(movie: controller.favoriteMovies[index]),
            );
          },
        );
      }),
    );
  }
}
