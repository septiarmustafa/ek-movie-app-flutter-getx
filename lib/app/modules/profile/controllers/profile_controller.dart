import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/models/movie.dart';
import 'package:ek_movie_app/app/services/api_services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxList favoriteMovies = <Movie>[].obs;
  RxList watchlistMovies = <Movie>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavoriteMovies();
    fetchWatchlistMovies();
  }

  void fetchFavoriteMovies() async {
    try {
      final movies = await ApiService().fetchFavoriteMovies();
      favoriteMovies.assignAll(movies);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColor.whiteColor);
    }
  }

  void fetchWatchlistMovies() async {
    try {
      final movies = await ApiService().fetchWatchlistMovies();
      watchlistMovies.assignAll(movies);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColor.whiteColor);
    }
  }

  Future<void> addToFavorite(String movieId, bool isFavorite) async {
    await ApiService().postFavoriteMovie(movieId, isFavorite);
    fetchFavoriteMovies();
  }

  Future<void> addToWatchlist(String movieId, bool isWatchlist) async {
    await ApiService().postWatchlistMovie(movieId, isWatchlist);
    fetchWatchlistMovies();
  }
}
