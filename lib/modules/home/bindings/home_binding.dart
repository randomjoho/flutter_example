import 'package:example/modules/home/controller/home_ctrl.dart';
import 'package:example/modules/home/repo/home_repo_impl.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeCtrl>(
      () => HomeCtrl(
        homeRepo: HomeRepoImpl(),
      ),
    );
  }
}
