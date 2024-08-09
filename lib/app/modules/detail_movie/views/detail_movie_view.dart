import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/models/movie.dart';
import 'package:ek_movie_app/app/services/api_url.dart';
import 'package:ek_movie_app/app/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import '../controllers/detail_movie_controller.dart';

class DetailMovieView extends GetView<DetailMovieController> {
  final Movie movie;
  DetailMovieView(this.movie) : super(key: Key(movie.id.toString()));

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(DetailMovieController(movie), tag: movie.id.toString());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.brownColor),
        title: Text(
          movie.title,
          style: const TextStyle(color: AppColor.brownColor),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: AppColor.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network('$photoBaseUrl${movie.posterPath}'),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      top: 50,
                      left: 50,
                      right: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          '$photoBaseUrl${movie.posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                        color: AppColor.whiteColor, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColor.brownColor,
                        size: 18,
                      ),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: const TextStyle(
                            color: AppColor.whiteColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: Obx(() {
                    return Text(
                      'Genre: ${controller.getGenreNames(movie.genreIds)}',
                      style: const TextStyle(
                          color: AppColor.whiteColor, fontSize: 14),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    movie.overview,
                    style: const TextStyle(
                        color: AppColor.whiteColor, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text('Similar Movies',
                      style:
                          TextStyle(fontSize: 20, color: AppColor.whiteColor)),
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i in controller.similarMovies.take(20))
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  '/detail-movie',
                                  arguments: i,
                                  parameters: {'id': i.id.toString()},
                                  preventDuplicates: false,
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: MovieCard(movie: i),
                              ),
                            )
                        ],
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
