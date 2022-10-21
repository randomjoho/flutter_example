import 'package:dio/dio.dart';
import 'package:example/base/base_controller.dart';
import 'package:example/data/local/model/home_search.dart';
import 'package:example/data/local/search_dao.dart';
import 'package:example/data/remote/home/response/detail_info.dart';
import 'package:example/modules/home/repo/home_repo.dart';
import 'package:get/get.dart';

class SearchCtrl extends BaseController {
  SearchCtrl({
    required HomeRepo homeRepo,
  }) {
    _repository = homeRepo;
  }

  static SearchCtrl get to => Get.find();

  late final HomeRepo _repository;

  final RxList<HomeSearchModel> searchList = RxList<HomeSearchModel>();

  @override
  void onInit() {
    super.onInit();
  }

  void searchItem(String key) {
    // 从本地获取数据
    final List<HomeSearchModel> list = SearchDao.search(key);

    searchList.assignAll(list);
  }

  void updateInfo(String id) {
    completeFetch(id, (CancelToken token) => _repository.updateInfo(id, token))
        .then(refreshData);
  }

  void refreshData(DetailInfo value) {
    final int index = searchList.indexWhere(
        (HomeSearchModel element) => element.appId == value.trackId.toString());
    if (index != -1) {
      searchList[index] = searchList[index].copyWith(
        userRatingCountForCurrentVersion:
            value.userRatingCountForCurrentVersion,
        averageUserRatingForCurrentVersion:
            value.averageUserRatingForCurrentVersion,
      );
    }

    SearchDao.updateDetail(value);
  }

  @override
  void retry() {
    print('search ctrl retry');
  }
}
