import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/models/movie.dart';
import 'package:ek_movie_app/app/services/api_services.dart';
import 'package:get/get.dart';

class WatchlistMovieController extends GetxController {
  RxList<Movie> watchlistMovies = <Movie>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWatchlistMovies();
  }

  void fetchWatchlistMovies() async {
    try {
      isLoading(true);
      final movies = await ApiService().fetchWatchlistMovies();
      watchlistMovies.value = movies;
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColor.whiteColor);
    } finally {
      isLoading(false);
    }
  }
}
