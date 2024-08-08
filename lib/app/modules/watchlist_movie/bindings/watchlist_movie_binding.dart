import 'package:get/get.dart';

import '../controllers/watchlist_movie_controller.dart';

class WatchlistMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchlistMovieController>(
      () => WatchlistMovieController(),
    );
  }
}
