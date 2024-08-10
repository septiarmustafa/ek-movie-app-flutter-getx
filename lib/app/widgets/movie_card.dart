import 'package:ek_movie_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/models/movie.dart';
import 'package:ek_movie_app/app/services/api_string.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return Stack(
      children: [
        Container(
          width: 180,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [AppColor.shadow],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              '$photoBaseUrl${movie.posterPath}',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColor.backgroundColor.withOpacity(0.8),
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: AppColor.brownColor,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: const TextStyle(
                    color: AppColor.textWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(8)),
                  color: AppColor.backgroundColor.withOpacity(0.8),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await profileController.addToWatchlist(
                            movie.id.toString(), true);
                        Get.snackbar('Success', 'Added to Watchlist',
                            colorText: AppColor.whiteColor);
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.bookmark_outline,
                              color: AppColor.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await profileController.addToFavorite(
                            movie.id.toString(), true);
                        Get.snackbar('Success', 'Added to Favorite',
                            colorText: AppColor.whiteColor);
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite_outline,
                          color: AppColor.redColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
