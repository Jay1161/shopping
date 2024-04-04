import 'package:get/get.dart';
import 'package:farmcart/controller/base_controller.dart';
import 'package:farmcart/controller/home_controller.dart';
import 'package:farmcart/controller/login_controller.dart';
import 'package:farmcart/data/repo/base_repo.dart';
import 'package:farmcart/data/repo/home_repo.dart';
import 'package:farmcart/data/repo/login_repo.dart';
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController(BaseRepo()), fenix: true);
    Get.lazyPut(() => LoginController(LoginRepo()), fenix: true);
    Get.lazyPut(() => HomeController(HomeRepo()), fenix: true);

  }
}
