import 'package:get/get.dart';

import '../controllers/favorite_movie_controller.dart';

class FavoriteMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteMovieController>(
      () => FavoriteMovieController(),
    );
  }
}
