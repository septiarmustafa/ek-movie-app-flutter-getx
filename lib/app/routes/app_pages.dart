import 'package:ek_movie_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:ek_movie_app/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:get/get.dart';

import '../models/movie.dart';
import '../modules/detail_movie/bindings/detail_movie_binding.dart';
import '../modules/detail_movie/views/detail_movie_view.dart';
import '../modules/favorite_movie/bindings/favorite_movie_binding.dart';
import '../modules/favorite_movie/views/favorite_movie_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/watchlist_movie/bindings/watchlist_movie_binding.dart';
import '../modules/watchlist_movie/views/watchlist_movie_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: '/dashboard',
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MOVIE,
      page: () {
        final Movie movie = Get.arguments as Movie;
        return DetailMovieView(movie);
      },
      binding: DetailMovieBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WATCHLIST_MOVIE,
      page: () => const WatchlistMovieView(),
      binding: WatchlistMovieBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE_MOVIE,
      page: () => const FavoriteMovieView(),
      binding: FavoriteMovieBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
