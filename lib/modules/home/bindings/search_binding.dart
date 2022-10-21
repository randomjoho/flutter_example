import 'package:example/modules/home/controller/search_ctrl.dart';
import 'package:example/modules/home/repo/home_repo_impl.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchCtrl>(
      () => SearchCtrl(
        homeRepo: HomeRepoImpl(),
      ),
    );
  }
}
