import 'package:ek_movie_app/app/constant/colors.dart';
import 'package:ek_movie_app/app/models/movie.dart';
import 'package:ek_movie_app/app/services/api_services.dart';
import 'package:get/get.dart';

class FavoriteMovieController extends GetxController {
  RxList<Movie> favoriteMovies = <Movie>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavoriteMovies();
  }

  void fetchFavoriteMovies() async {
    try {
      isLoading(true);
      final movies = await ApiService().fetchFavoriteMovies();
      favoriteMovies.value = movies;
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColor.whiteColor);
    } finally {
      isLoading(false);
    }
  }
}
