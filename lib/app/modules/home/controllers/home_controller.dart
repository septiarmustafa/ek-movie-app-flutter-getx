import 'package:get/get.dart';
import 'package:ek_movie_app/app/models/movie.dart';
import 'package:ek_movie_app/app/services/api_services.dart';

class HomeController extends GetxController {
  var nowPlayingMovies = <Movie>[].obs;
  var popularMovies = <Movie>[].obs;
  var topRatedMovies = <Movie>[].obs;

  var isLoadingNowPlaying = false.obs;
  var isLoadingPopular = false.obs;
  var isLoadingTopRated = false.obs;

  @override
  void onInit() {
    fetchNowPlayingMovies();
    fetchPopularMovies();
    fetchTopRatedMovies();
    super.onInit();
  }

  void fetchNowPlayingMovies() async {
    isLoadingNowPlaying(true);
    try {
      var movies = await ApiService().fetchNowPlayingMovies();
      nowPlayingMovies.assignAll(movies);
    } finally {
      isLoadingNowPlaying(false);
    }
  }

  void fetchPopularMovies() async {
    isLoadingPopular(true);
    try {
      var movies = await ApiService().fetchPopularMovies();
      popularMovies.assignAll(movies);
    } finally {
      isLoadingPopular(false);
    }
  }

  void fetchTopRatedMovies() async {
    isLoadingTopRated(true);
    try {
      var movies = await ApiService().fetchTopRatedMovies();
      topRatedMovies.assignAll(movies);
    } finally {
      isLoadingTopRated(false);
    }
  }
}
