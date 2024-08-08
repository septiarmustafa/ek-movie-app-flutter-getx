import 'package:ek_movie_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ek_movie_app/app/modules/home/controllers/home_controller.dart';
import 'package:ek_movie_app/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
