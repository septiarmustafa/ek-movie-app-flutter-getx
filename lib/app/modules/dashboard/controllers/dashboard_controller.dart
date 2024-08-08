import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt tabIndex = 0.obs;

  void changeBottomBar(int index) {
    tabIndex.value = index;
    update();
  }

  final count = 0.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      tabIndex.value = Get.arguments;
    }
    super.onInit();
  }
}
