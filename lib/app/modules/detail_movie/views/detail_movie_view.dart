import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/models/movie.dart';
import 'package:ek_movie_app/app/services/api_services.dart';
import 'package:ek_movie_app/app/services/api_url.dart';
import 'package:ek_movie_app/app/widgets/movie_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_movie_controller.dart';

class DetailMovieView extends GetView<DetailMovieController> {
  final Movie movie;
  const DetailMovieView(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title,
            style: const TextStyle(color: AppColor.textWhiteColor)),
        backgroundColor: AppColor.blueColor,
      ),
      body: Container(
        color: AppColor.whiteColor2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('$photoBaseUrl${movie.posterPath}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie.title,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie.overview),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Rating: ${movie.voteAverage}'),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Similar Movies',
                  style: TextStyle(fontSize: 20, color: AppColor.blueColor)),
            ),
            Expanded(
              child: FutureBuilder<List<Movie>>(
                future: ApiService().fetchSimilarMovies(movie.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final similarMovies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: similarMovies.length,
                      itemBuilder: (context, index) {
                        final similarMovie = similarMovies[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('/detail-movie',
                                arguments: similarMovie);
                          },
                          child: MovieCard(movie: similarMovie),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
