import 'package:bazar/data/api/api_client.dart';
import 'package:bazar/data/repo/home_repo.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(HomeRepo(ApiClient())));
  }
}
