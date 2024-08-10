import 'dart:developer';

import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/models/genre.dart';
import 'package:ek_movie_app/app/models/movie.dart';
import 'package:ek_movie_app/app/services/api_services.dart';
import 'package:get/get.dart';

class DetailMovieController extends GetxController {
  var movie = Movie(
    adult: false,
    backdropPath: '',
    genreIds: [],
    id: 0,
    originalLanguage: '',
    originalTitle: '',
    overview: '',
    popularity: 0.0,
    posterPath: '',
    releaseDate: '',
    title: '',
    video: false,
    voteAverage: 0.0,
    voteCount: 0,
  ).obs;

  DetailMovieController(Movie initialMovie) {
    movie.value = initialMovie;
  }

  var similarMovies = <Movie>[].obs;
  final genres = <Genre>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSimilarMovies();
    fetchGenres();
  }

  void fetchSimilarMovies() async {
    try {
      isLoading(true);
      similarMovies.value =
          await ApiService().fetchSimilarMovies(movie.value.id);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColor.whiteColor);
    } finally {
      isLoading(false);
    }
  }

  void fetchGenres() async {
    try {
      final genreList = await ApiService().fetchGenres();
      genres.assignAll(genreList);
    } catch (e) {
      log(e.toString());
    }
  }

  String getGenreNames(List<int> genreIds) {
    return genreIds.map((id) {
      final genre = genres.firstWhere((genre) => genre.id == id,
          orElse: () => Genre(id: id, name: 'Unknown'));
      return genre.name;
    }).join(', ');
  }

  void updateMovie(Movie newMovie) {
    movie.value = newMovie;
    fetchSimilarMovies();
  }
}
